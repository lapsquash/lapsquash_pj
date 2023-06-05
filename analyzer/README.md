# 要件定義

## 概要

動画の保存と要求の処理と AI での解析をする backend

## フレームワーク

- wrangler
- TypeScript
- Hono

## 機能一覧

- [ ] Credential の発行と管理
  - Azure AD の認可サーバーへ, トークンリクエストを送る
  - アクセストークンとリフレッシュトークンをもらう
  - アクセストークンをもとに, ユーザーの uuid を取得する
  - Cloudflare D1 に uuid をキーに, トークン類などを保存する
  - クライアント用の Credential を発行 & return
- [ ] SharePoint との接続
  - 共有リンクの発行とファイル URL の発行 (blob で返すのもアリ)
  - ファイルアップロード (どうしよう...)
- [ ] API スキーマの生成
  - aspida で作ってはいる...
  - ブランチから index.ts のみを clone して, それをもとに $api と $mock を生成する

## ログインのフロー

```mermaid
sequenceDiagram
  autonumber
  participant viewer
  participant analyzer
  participant cloudflare D1
  participant Azure AD
  participant Graph API

  viewer ->> Azure AD : 認証のリクエスト
  Note right of viewer: Auth Request <br /> [redirect]

  loop ユーザーによるログイン
    Azure AD  ->> Azure AD : Microsoftアカウントを使った<br />ユーザーのログイン
  end

  Azure AD -->> viewer: code の発行, リダイレクト
  Note left of Azure AD : Auth Response

  viewer ->>+ analyzer: プリフライトリクエスト (自動)
  analyzer -->>- viewer: OK/200

  viewer ->>+ analyzer: codeを送る
  Note right of viewer: Send Grant Code <br /> [`/api/auth`]

  analyzer ->>+ Graph API: クライアントID, クライアントシークレット, codeを送る
  Note right of analyzer: Tokens Request <br /> (authentication_code)

  Graph API -->>- analyzer: アクセストークン, リフレッシュトークンなどを返す
  Note left of Graph API: Tokens Response

  analyzer ->>+ cloudflare D1: uuidをキーに, デバイスIDや<br />トークンなどを保存
  Note right of analyzer: Tokens Store
  cloudflare D1 -->>- analyzer: OK/200

  analyzer ->>- viewer: Credential を返す
  Note left of analyzer: Credential

  viewer ->> viewer: httpOnly Cookie に <br /> Credential を保存
  Note right of viewer: LocalStore Type
```

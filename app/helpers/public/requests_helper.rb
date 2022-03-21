module Public::RequestsHelper
  def text_information
    <<-"EOS".strip_heredoc
       ［募集の経緯］
       　（入力例：経済的に飼えなくなったため募集いたします。）


       ［性格や特徴］
       　（入力例：とてもおとなしい性格です。少し臆病な一面もあります。）


       ［健康状態］
       　（入力例：健康面は特に問題ありません。）


       ［その他備考］

    EOS
  end
end

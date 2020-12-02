require 'test_helper'

class XmlControllerTest < ActionDispatch::IntegrationTest
  # Проверяем, какой формат получили от контроллера при запросе в RSS.
  test 'check rss format' do
    # Делаем запрос с параметрами - словарь превратится в lower=10&upper=100&format=rss
    get '/', params: { sequence: 13457321934, format: :rss }
    # Проверили, что получили статус ответа 200 OK
    assert_response :success
    # Тип ответа лежит в его заголовках, поэтому смотрим туда.
    assert_includes @response.headers['Content-Type'], 'application/rss'
  end
end

require 'test_helper'

class LocacoesControllerTest < ActionController::TestCase
  setup do
    @locacao = locacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create locacao" do
    assert_difference('Locacao.count') do
      post :create, locacao: { cliente_id: @locacao.cliente_id, data_devolucao: @locacao.data_devolucao, data_locacao: @locacao.data_locacao, quilometragem_final: @locacao.quilometragem_final, quilometragem_inicial: @locacao.quilometragem_inicial, valor_desconto: @locacao.valor_desconto, valor_diaria: @locacao.valor_diaria, veiculo_id: @locacao.veiculo_id }
    end

    assert_redirected_to locacao_path(assigns(:locacao))
  end

  test "should show locacao" do
    get :show, id: @locacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @locacao
    assert_response :success
  end

  test "should update locacao" do
    patch :update, id: @locacao, locacao: { cliente_id: @locacao.cliente_id, data_devolucao: @locacao.data_devolucao, data_locacao: @locacao.data_locacao, quilometragem_final: @locacao.quilometragem_final, quilometragem_inicial: @locacao.quilometragem_inicial, valor_desconto: @locacao.valor_desconto, valor_diaria: @locacao.valor_diaria, veiculo_id: @locacao.veiculo_id }
    assert_redirected_to locacao_path(assigns(:locacao))
  end

  test "should destroy locacao" do
    assert_difference('Locacao.count', -1) do
      delete :destroy, id: @locacao
    end

    assert_redirected_to locacoes_path
  end
end

$(document).ready(function() {

    function clear_zipcode_form() {
        // Limpa valores do formulário de CEP.
        $("#street").val("");
        $("#neighborhood").val("");
        $("#city").val("");
        $("#state").val("");
    }
    
    //Quando o campo CEP perde o foco.
    $(document).on("blur", "#zipcode", function() {

        //Nova variável "zipcode" somente com dígitos.
        var zipcode = $(this).val().replace(/\D/g, '');

        //Verifica se campo CEP possui valor informado.
        if (zipcode != "") {

            //Expressão regular para validar o CEP.
            var validate_zipcode = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if(validate_zipcode.test(zipcode)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                $("#street").val("...");
                $("#neighborhood").val("...");
                $("#city").val("...");
                $("#state").val("...");
                
                //Consulta o webservice viazipcode.com.br/
                $.getJSON("//viacep.com.br/ws/"+ zipcode +"/json/?callback=?", function(data) {

                    if (!("erro" in data)) {
                        //Atualiza os campos com os valores da consulta.
                        $("#street").val(data.logradouro);
                        $("#neighborhood").val(data.bairro);
                        $("#city").val(data.localidade);
                        $("#state").val(data.uf);
                    } //end if.
                    else {
                        //zipcode pesquisado não foi encontrado.
                        clear_zipcode_form();
                        alert("CEP não encontrado.");
                    }
                });
            } //end if.
            else {
                //CEP é inválido.
                clear_zipcode_form();
                alert("Formato de CEP inválido.");
            }
        } //end if.
        else {
            //CEP sem valor, limpa formulário.
            clear_zipcode_form();
        }
    });
});
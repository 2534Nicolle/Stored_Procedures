create database bd_clientes_1e;

create table tbl_clientes (
codigo int not null primary key auto_increment,
nome varchar(40) not null,
sexo char(1) not null
);

insert into tbl_clientes(nome,sexo)
values("Garro", "M"),
      ("Senna", "M"),
      ("Jade", "F");
      
select * from tbl_clientes;

#EXEMPLO 1
DELIMITER $$
create procedure sp_lista_clientes(IN opcao INT)
begin
	if opcao = 0 then
        select * from tbl_clientes where sexo = 'F';
    elseif opcao = 1 then
        select * from tbl_clientes where sexo = 'M';
	else
        select * from tbl_clientes;
	end if;
end $$
DELIMITER ;

SHOW procedure status;

#Lista sexo Feminino:
call sp_lista_clientes(0);
#Lista sexo Masculino:
call sp_lista_clientes(1);
#Lista todos:
call sp_lista_clientes(2);


#EXEMPLO 2
DELIMITER $$

create procedure sp_busca_cliente_por_nome(IN nome_parcial VARCHAR(100))
begin
    SELECT * FROM tbl_clientes
    where nome like concat('%', nome_parcial, '%');
end $$

DELIMITER ;

call sp_busca_cliente_por_nome('A');


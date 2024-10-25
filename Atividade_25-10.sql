create database procedures_1e;

create table tbl_clientes2 (
id int not null primary key auto_increment,
nome varchar(100) not null,
idade int not null,
sexo char(1) not null,
email varchar(100) not null,
telefone varchar(15) not null,
endereco varchar(225)not null
);

insert into tbl_clientes2(nome,idade, sexo, email, telefone, endereco)
values("Garro",19,"M","garro'@'localhost","31987654321", "Rua G, 321"),
      ("Senna",25, "M","senna'@'localhost","31987654354", "Rua B, 213"),
      ("Jade",45, "F","jade'@'localhost","31987654376", "Rua I, 312");
      
DELIMITER $$
create procedure sp_lista_clientes(IN opcao INT)
begin
	if opcao = 0 then
        select * from tbl_clientes2 where idade >= 18;
    elseif opcao = 1 then
        select * from tbl_clientes2 where idade < 18;
	else
        select * from tbl_clientes2;
	end if;
end $$
DELIMITER ;

SHOW procedure status;

call sp_lista_clientes(0);

call sp_lista_clientes(1);
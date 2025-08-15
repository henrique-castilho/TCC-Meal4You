CREATE TABLE `usuario` (
	`id_usuario` INTEGER NOT NULL AUTO_INCREMENT,
	`email` VARCHAR(255) NOT NULL UNIQUE,
	`nome` VARCHAR(100) NOT NULL,
	`senha` VARCHAR(60) NOT NULL,
	`localizacao` VARCHAR(150) NOT NULL,
	`tempo_disponivel` INTEGER,
	`data_nascimento` DATE NOT NULL,
	PRIMARY KEY(`id_usuario`)
);


CREATE TABLE `restaurante` (
	`id_restaurante` INTEGER NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(100) NOT NULL UNIQUE,
	`localizacao` VARCHAR(150) NOT NULL,
	`tipo_comida` VARCHAR(100) NOT NULL,
	`tempo_estimado` INTEGER,
	`aberto` BOOLEAN NOT NULL,
	PRIMARY KEY(`id_restaurante`)
);


CREATE TABLE `refeicao` (
	`id_refeicao` INTEGER NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(100) NOT NULL,
	`descricao` TEXT,
	`tipo` VARCHAR(100) NOT NULL,
	`preco` DECIMAL(10,2) NOT NULL,
	`tempo_preparo` INTEGER,
	`id_restaurante` INTEGER NOT NULL,
	PRIMARY KEY(`id_refeicao`)
);


CREATE TABLE `sugestao` (
	`id_sugestao` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`id_usuario` INTEGER NOT NULL,
	`id_refeicao` INTEGER NOT NULL,
	PRIMARY KEY(`id_sugestao`)
);


CREATE TABLE `avaliacao` (
	`id_avaliacao` INTEGER NOT NULL AUTO_INCREMENT,
	`id_usuario` INTEGER NOT NULL,
	`id_refeicao` INTEGER NOT NULL,
	`nota` INTEGER NOT NULL CHECK(`nota` BETWEEN 1 AND 5),
	`comentario` VARCHAR(255),
	`data` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(`id_avaliacao`)
);


CREATE TABLE `refeicao_favorita` (
	`id_usuario` INTEGER NOT NULL,
	`id_refeicao` INTEGER NOT NULL,
	`data_adicionado` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(`id_usuario`, `id_refeicao`)
);


CREATE TABLE `restaurante_favorito` (
	`id_usuario` INTEGER NOT NULL,
	`id_restaurante` INTEGER NOT NULL,
	PRIMARY KEY(`id_usuario`, `id_restaurante`)
);


CREATE TABLE `ingrediente` (
	`id_ingrediente` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`nome` VARCHAR(100) NOT NULL,
	PRIMARY KEY(`id_ingrediente`)
);


CREATE TABLE `refeicao_ingrediente` (
	`id_refeicao` INTEGER NOT NULL,
	`id_ingrediente` INTEGER NOT NULL,
	PRIMARY KEY(`id_refeicao`, `id_ingrediente`)
);


CREATE TABLE `restricao_alimentar` (
	`id_restricao` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`nome` VARCHAR(100) NOT NULL,
	PRIMARY KEY(`id_restricao`)
);


CREATE TABLE `usuario_restricao` (
	`id_usuario` INTEGER NOT NULL,
	`id_restricao` INTEGER NOT NULL,
	PRIMARY KEY(`id_usuario`, `id_restricao`)
);


CREATE TABLE `preferencia_alimentar` (
	`id_preferencia` INTEGER NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(100) NOT NULL,
	PRIMARY KEY(`id_preferencia`)
);


CREATE TABLE `usuario_preferencia` (
	`id_usuario` INTEGER NOT NULL,
	`id_preferencia` INTEGER NOT NULL,
	PRIMARY KEY(`id_usuario`, `id_preferencia`)
);


CREATE TABLE `filtro_pesquisa` (
	`id_filtro` INTEGER NOT NULL AUTO_INCREMENT,
	`id_usuario` INTEGER NOT NULL,
	`tipo_comida` VARCHAR(100) NOT NULL,
	`faixa_preco` DECIMAL(10,2) NOT NULL,
	`distancia_maxima` DECIMAL(10,2) NOT NULL,
	`data_filtro` DATE NOT NULL,
	PRIMARY KEY(`id_filtro`)
);


CREATE TABLE `historico_sugestao` (
	`id_usuario` INTEGER NOT NULL,
	`id_refeicao` INTEGER NOT NULL,
	`data_sugestao` DATETIME NOT NULL,
	`aceita` BOOLEAN NOT NULL,
	PRIMARY KEY(`id_usuario`, `id_refeicao`)
);


ALTER TABLE `refeicao`
ADD FOREIGN KEY(`id_restaurante`) REFERENCES `restaurante`(`id_restaurante`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `avaliacao`
ADD FOREIGN KEY(`id_usuario`) REFERENCES `usuario`(`id_usuario`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `avaliacao`
ADD FOREIGN KEY(`id_refeicao`) REFERENCES `refeicao`(`id_refeicao`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `refeicao_favorita`
ADD FOREIGN KEY(`id_usuario`) REFERENCES `usuario`(`id_usuario`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `refeicao_favorita`
ADD FOREIGN KEY(`id_refeicao`) REFERENCES `refeicao`(`id_refeicao`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `refeicao_ingrediente`
ADD FOREIGN KEY(`id_refeicao`) REFERENCES `refeicao`(`id_refeicao`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `refeicao_ingrediente`
ADD FOREIGN KEY(`id_ingrediente`) REFERENCES `ingrediente`(`id_ingrediente`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `usuario_restricao`
ADD FOREIGN KEY(`id_usuario`) REFERENCES `usuario`(`id_usuario`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `usuario_restricao`
ADD FOREIGN KEY(`id_restricao`) REFERENCES `restricao_alimentar`(`id_restricao`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `usuario_preferencia`
ADD FOREIGN KEY(`id_usuario`) REFERENCES `usuario`(`id_usuario`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `usuario_preferencia`
ADD FOREIGN KEY(`id_preferencia`) REFERENCES `preferencia_alimentar`(`id_preferencia`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `filtro_pesquisa`
ADD FOREIGN KEY(`id_usuario`) REFERENCES `usuario`(`id_usuario`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `historico_sugestao`
ADD FOREIGN KEY(`id_usuario`) REFERENCES `usuario`(`id_usuario`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `historico_sugestao`
ADD FOREIGN KEY(`id_refeicao`) REFERENCES `refeicao`(`id_refeicao`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `sugestao`
ADD FOREIGN KEY(`id_usuario`) REFERENCES `usuario`(`id_usuario`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `sugestao`
ADD FOREIGN KEY(`id_refeicao`) REFERENCES `refeicao`(`id_refeicao`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `restaurante_favorito`
ADD FOREIGN KEY(`id_usuario`) REFERENCES `usuario`(`id_usuario`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `restaurante_favorito`
ADD FOREIGN KEY(`id_restaurante`) REFERENCES `restaurante`(`id_restaurante`)
ON UPDATE CASCADE ON DELETE CASCADE;
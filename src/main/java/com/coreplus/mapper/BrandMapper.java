package com.coreplus.mapper;

import java.util.List;

import com.coreplus.domain.BrandVO;

public interface BrandMapper {

	public List<BrandVO> getList(String brand_cd);

	public List<BrandVO> getBrands(String fra_cd);
	
}

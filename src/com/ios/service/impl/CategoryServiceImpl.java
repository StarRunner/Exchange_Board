package com.ios.service.impl;

import com.ios.entity.Category;
import com.ios.entity.custom.ArticleCustom;
import com.ios.entity.custom.ArticleListVo;
import com.ios.entity.custom.CategoryCustom;
import com.ios.mapper.CategoryMapper;
import com.ios.mapper.custom.ArticleMapperCustom;
import com.ios.mapper.custom.CategoryMapperCustom;
import com.ios.service.CategoryService;
import com.ios.util.others.Page;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


/**
 * 用户管理
 * Created by 言曌 on 2017/8/24.
 */
@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryMapperCustom categoryMapperCustom;
	
	@Autowired
	private CategoryMapper categoryMapper;

	@Autowired
	private ArticleMapperCustom articleMapperCustom;

	@Override
	public Integer countCategory(Integer status) throws Exception {
		Integer categoryCount = categoryMapperCustom.countCategory(status);
		return categoryCount;
	}
	
	@Override
	public List<CategoryCustom> listCategory(Integer status) throws Exception {
		List<CategoryCustom> categoryCustomList = categoryMapperCustom.listCategory(status);
		for(int i=0;i<categoryCustomList.size();i++) {
			Integer cateId = categoryCustomList.get(i).getCategoryId();
			Integer count = articleMapperCustom.countArticleByCategory(status,cateId);
			categoryCustomList.get(i).setArticleCount(count);
		}

		return categoryCustomList;
	}
	
	@Override
	public List<ArticleListVo> listArticleWithCategoryByPage(Integer status,Integer pageNow, Integer pageSize,Integer cateId) throws Exception {
		List<ArticleListVo> articleListVoList = new ArrayList<ArticleListVo>();
		List<ArticleCustom> articleCustomList = new ArrayList<ArticleCustom>();
		
		//获得分类的信息
		Category category = categoryMapper.selectByPrimaryKey(cateId);
		//如果没有这个分类，返回null
		if(category==null) {
			return null;
		}

		//分页显示
		Page page = null;
		int totalCount = articleMapperCustom.countArticleByCategory(status,cateId);

		if (pageNow != null) {
			page = new Page(totalCount, pageNow,pageSize);
			articleCustomList = categoryMapperCustom.listArticleWithCategoryByPage(status,cateId,(page.getPageNow() - 1) * pageSize+1,pageSize*page.getPageNow());
		} else {
			page = new Page(totalCount, 1,pageSize);
			articleCustomList = categoryMapperCustom.listArticleWithCategoryByPage(status,cateId,(page.getPageNow() - 1) * pageSize+1,pageSize*page.getPageNow());
			}
		
		for(int i=0;i<articleCustomList.size();i++) {
			ArticleListVo articleListVo = new ArticleListVo();
			
			//1、将Article信息装入 articleListVo
			ArticleCustom articleCustom = articleCustomList.get(i);
			articleListVo.setArticleCustom(articleCustom);


			//2、将分类信息装到 articleListVoList 中
			List<CategoryCustom> categoryCustomList = new ArrayList<CategoryCustom>();
			Integer parentCategoryId =articleCustomList.get(i).getArticleParentCategoryId();
			Integer childCategoryId =articleCustomList.get(i).getArticleChildCategoryId();
			CategoryCustom categoryCustom = categoryMapperCustom.getCategoryById(status, parentCategoryId);
			CategoryCustom categoryCustom2 = categoryMapperCustom.getCategoryById(status,childCategoryId);
			if(categoryCustom!=null) {
				categoryCustomList.add(categoryCustom);
			}
			if(categoryCustom2!=null) {
				categoryCustomList.add(categoryCustom2);
			}
			articleListVo.setCategoryCustomList(categoryCustomList);

			articleListVoList.add(articleListVo);
		}
        //如果该分类还没有Article
        if(totalCount!=0) {
            //2、将Page信息存储在第一个元素中
            articleListVoList.get(0).setPage(page);
        }
		return articleListVoList;
	}

	@Override
	public CategoryCustom getCategory(Integer status,Integer id) throws Exception {
		CategoryCustom categoryCustom = categoryMapperCustom.getCategoryById(status,id);
		return categoryCustom;
	}

    @Override
    public void deleteCategory(Integer id) throws Exception {
        categoryMapperCustom.deleteCategory(id);
    }

    @Override
    public CategoryCustom getCategoryById(Integer status,Integer id) throws Exception {
		CategoryCustom categoryCustom = categoryMapperCustom.getCategoryById(status,id);
        return categoryCustom;
    }

	@Override
	public void insertCategory(Category category) throws Exception {
		categoryMapper.insertSelective(category);
	}

	@Override
	public void updateCategory(Category category) throws Exception {
		categoryMapper.updateByPrimaryKeySelective(category);
	}

	@Override
	public Category getCategoryByName(String name) throws Exception {
		Category category = categoryMapperCustom.getCategoryByName(name);
		return category;
	}


}

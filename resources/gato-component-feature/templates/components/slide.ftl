[#if !(ctx.barsonly!false)]
  <div class="slide ${ctx.slideactive!''} ${ctx.colorClass!}">
    [#if content.link?has_content]
      <a href="${gf.filterUrl(content.link!)}">
    [/#if]

    <div class="image">
      <img src="${gf.getImgDefault(content.image)}" srcset="${gf.getSrcSet(content.image)}" class="bg" alt="${content.alttext!}">
    </div>
    <div class="caption">
      [#if content.title?has_content]<h3>${content.title}</h3>[/#if]
      <p>${content.subtext!}</p>
    </div>

    [#if content.link?has_content]
      </a>
    [/#if]
  </div>
[/#if]

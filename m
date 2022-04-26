Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3041E50F05D
	for <lists+linux-cachefs@lfdr.de>; Tue, 26 Apr 2022 07:40:49 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-b4Vi3OtDM1y10xkuCNGfrQ-1; Tue, 26 Apr 2022 01:40:45 -0400
X-MC-Unique: b4Vi3OtDM1y10xkuCNGfrQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B39921C073A9;
	Tue, 26 Apr 2022 05:40:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD745C44CF2;
	Tue, 26 Apr 2022 05:40:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 043D21949761;
	Tue, 26 Apr 2022 05:40:16 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 547E819451F2 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 26 Apr 2022 05:40:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 21FEE2166B2F; Tue, 26 Apr 2022 05:40:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CBBA2166BDF
 for <linux-cachefs@redhat.com>; Tue, 26 Apr 2022 05:40:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3FDB3C0CD3E
 for <linux-cachefs@redhat.com>; Tue, 26 Apr 2022 05:40:07 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-izv3XsejNyGK1CQLjMgVSQ-1; Tue, 26 Apr 2022 01:40:02 -0400
X-MC-Unique: izv3XsejNyGK1CQLjMgVSQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=21; SR=0; TI=SMTPD_---0VBJMJAQ_1650951594
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VBJMJAQ_1650951594) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 26 Apr 2022 13:39:57 +0800
Date: Tue, 26 Apr 2022 13:39:54 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <YmeFqhYu5PNYu+8Z@B-P7TQMD6M-0146.local>
Mail-Followup-To: Jeffle Xu <jefflexu@linux.alibaba.com>,
 dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org,
 torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
 willy@infradead.org, linux-fsdevel@vger.kernel.org,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 tao.peng@linux.alibaba.com, gerry@linux.alibaba.com,
 eguan@linux.alibaba.com, linux-kernel@vger.kernel.org,
 luodaowen.backend@bytedance.com, tianzichen@kuaishou.com,
 fannaihao@baidu.com, zhangjiachen.jaycee@bytedance.com,
 zhujia.zj@bytedance.com
References: <20220425122143.56815-1-jefflexu@linux.alibaba.com>
 <20220425122143.56815-18-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220425122143.56815-18-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH v10 17/21] erofs: implement
 fscache-based metadata read
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: zhujia.zj@bytedance.com, tianzichen@kuaishou.com,
 linux-erofs@lists.ozlabs.org, chao@kernel.org, fannaihao@baidu.com,
 tao.peng@linux.alibaba.com, willy@infradead.org, linux-kernel@vger.kernel.org,
 joseph.qi@linux.alibaba.com, zhangjiachen.jaycee@bytedance.com,
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 25, 2022 at 08:21:39PM +0800, Jeffle Xu wrote:
> Implement the data plane of reading metadata from primary data blob
> over fscache.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

> ---
>  fs/erofs/data.c    | 19 +++++++++++++++----
>  fs/erofs/fscache.c | 25 +++++++++++++++++++++++++
>  2 files changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> index 14b64d960541..bb9c1fd48c19 100644
> --- a/fs/erofs/data.c
> +++ b/fs/erofs/data.c
> @@ -6,6 +6,7 @@
>   */
>  #include "internal.h"
>  #include <linux/prefetch.h>
> +#include <linux/sched/mm.h>
>  #include <linux/dax.h>
>  #include <trace/events/erofs.h>
>  
> @@ -35,14 +36,20 @@ void *erofs_bread(struct erofs_buf *buf, struct inode *inode,
>  	erofs_off_t offset = blknr_to_addr(blkaddr);
>  	pgoff_t index = offset >> PAGE_SHIFT;
>  	struct page *page = buf->page;
> +	struct folio *folio;
> +	unsigned int nofs_flag;
>  
>  	if (!page || page->index != index) {
>  		erofs_put_metabuf(buf);
> -		page = read_cache_page_gfp(mapping, index,
> -				mapping_gfp_constraint(mapping, ~__GFP_FS));
> -		if (IS_ERR(page))
> -			return page;
> +
> +		nofs_flag = memalloc_nofs_save();
> +		folio = read_cache_folio(mapping, index, NULL, NULL);
> +		memalloc_nofs_restore(nofs_flag);
> +		if (IS_ERR(folio))
> +			return folio;
> +
>  		/* should already be PageUptodate, no need to lock page */
> +		page = folio_file_page(folio, index);
>  		buf->page = page;
>  	}
>  	if (buf->kmap_type == EROFS_NO_KMAP) {
> @@ -63,6 +70,10 @@ void *erofs_bread(struct erofs_buf *buf, struct inode *inode,
>  void *erofs_read_metabuf(struct erofs_buf *buf, struct super_block *sb,
>  			 erofs_blk_t blkaddr, enum erofs_kmap_type type)
>  {
> +	if (erofs_is_fscache_mode(sb))
> +		return erofs_bread(buf, EROFS_SB(sb)->s_fscache->inode,
> +				   blkaddr, type);
> +
>  	return erofs_bread(buf, sb->s_bdev->bd_inode, blkaddr, type);
>  }
>  
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> index ac02af8cce3e..23d7e862eed8 100644
> --- a/fs/erofs/fscache.c
> +++ b/fs/erofs/fscache.c
> @@ -59,7 +59,32 @@ static int erofs_fscache_read_folios(struct fscache_cookie *cookie,
>  	return ret;
>  }
>  
> +static int erofs_fscache_meta_readpage(struct file *data, struct page *page)
> +{
> +	int ret;
> +	struct folio *folio = page_folio(page);
> +	struct super_block *sb = folio_mapping(folio)->host->i_sb;
> +	struct erofs_map_dev mdev = {
> +		.m_deviceid = 0,
> +		.m_pa = folio_pos(folio),
> +	};
> +
> +	ret = erofs_map_dev(sb, &mdev);
> +	if (ret)
> +		goto out;
> +
> +	ret = erofs_fscache_read_folios(mdev.m_fscache->cookie,
> +			folio_mapping(folio), folio_pos(folio),
> +			folio_size(folio), mdev.m_pa);
> +	if (!ret)
> +		folio_mark_uptodate(folio);
> +out:
> +	folio_unlock(folio);
> +	return ret;
> +}
> +
>  static const struct address_space_operations erofs_fscache_meta_aops = {
> +	.readpage = erofs_fscache_meta_readpage,
>  };
>  
>  int erofs_fscache_register_cookie(struct super_block *sb,
> -- 
> 2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


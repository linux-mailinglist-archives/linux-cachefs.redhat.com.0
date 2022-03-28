Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 131784E8C7B
	for <lists+linux-cachefs@lfdr.de>; Mon, 28 Mar 2022 05:15:03 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-7rkbb1f5NqqOnd4opAcluQ-1; Sun, 27 Mar 2022 23:15:00 -0400
X-MC-Unique: 7rkbb1f5NqqOnd4opAcluQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54F2D101A54C;
	Mon, 28 Mar 2022 03:14:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 48C361400C2C;
	Mon, 28 Mar 2022 03:14:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 59D791940342;
	Mon, 28 Mar 2022 03:14:57 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F0B9F1947BBD for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 28 Mar 2022 03:14:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C69E2400E111; Mon, 28 Mar 2022 03:14:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2DF240C1257
 for <linux-cachefs@redhat.com>; Mon, 28 Mar 2022 03:14:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9349F2A5955E
 for <linux-cachefs@redhat.com>; Mon, 28 Mar 2022 03:14:56 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-nJNxUdYpPteWH2OVJexpVA-1; Sun, 27 Mar 2022 23:14:54 -0400
X-MC-Unique: nJNxUdYpPteWH2OVJexpVA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0V8KfeFt_1648437287
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0V8KfeFt_1648437287) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 28 Mar 2022 11:14:49 +0800
Date: Mon, 28 Mar 2022 11:14:47 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <YkEoJ4qZidqfRPhy@B-P7TQMD6M-0146.local>
Mail-Followup-To: Jeffle Xu <jefflexu@linux.alibaba.com>,
 dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org,
 torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
 willy@infradead.org, linux-fsdevel@vger.kernel.org,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 tao.peng@linux.alibaba.com, gerry@linux.alibaba.com,
 eguan@linux.alibaba.com, linux-kernel@vger.kernel.org,
 luodaowen.backend@bytedance.com, tianzichen@kuaishou.com,
 fannaihao@baidu.com
References: <20220325122223.102958-1-jefflexu@linux.alibaba.com>
 <20220325122223.102958-18-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220325122223.102958-18-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH v6 17/22] erofs: implement fscache-based
 data read for non-inline layout
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
Cc: tianzichen@kuaishou.com, linux-erofs@lists.ozlabs.org, chao@kernel.org,
 fannaihao@baidu.com, tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 25, 2022 at 08:22:18PM +0800, Jeffle Xu wrote:
> Implements the data plane of reading data from bootstrap blob file over
> fscache for non-inline layout.
> 
> Be noted that compressed layout is not supported yet.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/erofs/fscache.c  | 83 +++++++++++++++++++++++++++++++++++++++++++++
>  fs/erofs/inode.c    |  8 ++++-
>  fs/erofs/internal.h |  5 +++
>  3 files changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> index 91377939b4f7..4a9a4e60c15d 100644
> --- a/fs/erofs/fscache.c
> +++ b/fs/erofs/fscache.c
> @@ -60,10 +60,93 @@ static int erofs_fscache_readpage_blob(struct file *data, struct page *page)
>  	return ret;
>  }
>  
> +static inline int erofs_fscache_get_map(struct erofs_map_blocks *map,
> +					struct super_block *sb)

I wonder if m_fscache should be settled in struct erofs_map_dev

And such helper can be merged into erofs_map_dev() as well.

> +{
> +	struct erofs_sb_info *sbi = EROFS_SB(sb);
> +
> +	map->m_fscache	= sbi->bootstrap;
> +	return 0;
> +}
> +
> +static int erofs_fscache_readpage_noinline(struct folio *folio,
> +					   struct erofs_map_blocks *map)
> +{
> +	struct fscache_cookie *cookie = map->m_fscache->cookie;
> +	/*
> +	 * 1) For FLAT_PLAIN layout, the output map.m_la shall be equal to o_la,
> +	 * and the output map.m_pa is exactly the physical address of o_la.
> +	 * 2) For CHUNK_BASED layout, the output map.m_la is rounded down to the
> +	 * nearest chunk boundary, and the output map.m_pa is actually the
> +	 * physical address of this chunk boundary. So we need to recalculate
> +	 * the actual physical address of o_la.
> +	 */
> +	loff_t start = map->m_pa + (map->o_la - map->m_la);

I think o_la can be directly replaced with "folio_pos(folio)".

Also such helper might be unneeded...

> +
> +	return erofs_fscache_read_folio(cookie, folio, start);
> +}
> +
> +static int erofs_fscache_do_readpage(struct folio *folio)

Can it fold into erofs_fscache_readpage?
Another unneeded helper...

> +{
> +	struct inode *inode = folio_file_mapping(folio)->host;
> +	struct erofs_inode *vi = EROFS_I(inode);
> +	struct super_block *sb = inode->i_sb;
> +	struct erofs_map_blocks map;
> +	int ret;
> +
> +	if (erofs_inode_is_data_compressed(vi->datalayout)) {

It's impossible for now. So the check above is redundant.

Thanks,
Gao Xiang

> +		erofs_info(sb, "compressed layout not supported yet");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	DBG_BUGON(folio_size(folio) != EROFS_BLKSIZ);
> +
> +	map.m_la = map.o_la = folio_pos(folio);
> +
> +	ret = erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
> +	if (ret)
> +		return ret;
> +
> +	if (!(map.m_flags & EROFS_MAP_MAPPED)) {
> +		folio_zero_range(folio, 0, folio_size(folio));
> +		return 0;
> +	}
> +
> +	ret = erofs_fscache_get_map(&map, sb);
> +	if (ret)
> +		return ret;
> +
> +	switch (vi->datalayout) {
> +	case EROFS_INODE_FLAT_PLAIN:
> +	case EROFS_INODE_CHUNK_BASED:
> +		return erofs_fscache_readpage_noinline(folio, &map);
> +	default:
> +		DBG_BUGON(1);
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int erofs_fscache_readpage(struct file *file, struct page *page)
> +{
> +	struct folio *folio = page_folio(page);
> +	int ret;
> +
> +	ret = erofs_fscache_do_readpage(folio);
> +	if (!ret)
> +		folio_mark_uptodate(folio);
> +
> +	folio_unlock(folio);
> +	return ret;
> +}
> +
>  static const struct address_space_operations erofs_fscache_blob_aops = {
>  	.readpage = erofs_fscache_readpage_blob,
>  };
>  
> +const struct address_space_operations erofs_fscache_access_aops = {
> +	.readpage = erofs_fscache_readpage,
> +};
> +
>  /*
>   * erofs_fscache_get_folio - find and read page cache of blob file
>   * @ctx:	the context of the blob file
> diff --git a/fs/erofs/inode.c b/fs/erofs/inode.c
> index ff62f84f47d3..744faf3ef9f4 100644
> --- a/fs/erofs/inode.c
> +++ b/fs/erofs/inode.c
> @@ -296,7 +296,13 @@ static int erofs_fill_inode(struct inode *inode, int isdir)
>  		err = z_erofs_fill_inode(inode);
>  		goto out_unlock;
>  	}
> -	inode->i_mapping->a_ops = &erofs_raw_access_aops;
> +
> +#ifdef CONFIG_EROFS_FS_ONDEMAND
> +	if (erofs_is_nodev_mode(inode->i_sb))
> +		inode->i_mapping->a_ops = &erofs_fscache_access_aops;
> +#endif
> +	if (!erofs_is_nodev_mode(inode->i_sb))
> +		inode->i_mapping->a_ops = &erofs_raw_access_aops;
>  
>  out_unlock:
>  	erofs_put_metabuf(&buf);
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index fa89a1e3012f..6537ededed51 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -442,6 +442,9 @@ struct erofs_map_blocks {
>  	unsigned short m_deviceid;
>  	char m_algorithmformat;
>  	unsigned int m_flags;
> +
> +	struct erofs_fscache *m_fscache;
> +	erofs_off_t o_la;
>  };
>  
>  /* Flags used by erofs_map_blocks_flatmode() */
> @@ -634,6 +637,8 @@ struct erofs_fscache *erofs_fscache_get(struct super_block *sb, char *path,
>  void erofs_fscache_put(struct erofs_fscache *ctx);
>  
>  struct folio *erofs_fscache_get_folio(struct erofs_fscache *ctx, pgoff_t index);
> +
> +extern const struct address_space_operations erofs_fscache_access_aops;
>  #else
>  static inline int erofs_init_fscache(void) { return 0; }
>  static inline void erofs_exit_fscache(void) {}
> -- 
> 2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B374F9336
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Apr 2022 12:44:36 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-mMwqHp97Nvy76xS-YHHWNw-1; Fri, 08 Apr 2022 06:44:33 -0400
X-MC-Unique: mMwqHp97Nvy76xS-YHHWNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D536D282B80F;
	Fri,  8 Apr 2022 10:44:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 087F5111F3D9;
	Fri,  8 Apr 2022 10:44:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C1E8C194034F;
	Fri,  8 Apr 2022 10:44:31 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C52441947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 14:24:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 18EBB407C943; Thu,  7 Apr 2022 14:24:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1487E407DEC9
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 14:24:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38CAC18F0246
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 14:24:23 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-s1XaeXmGN6-fUsitaDOAaA-1; Thu, 07 Apr 2022 10:24:18 -0400
X-MC-Unique: s1XaeXmGN6-fUsitaDOAaA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 52D2FB82735;
 Thu,  7 Apr 2022 14:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C17C385A4;
 Thu,  7 Apr 2022 14:24:09 +0000 (UTC)
Date: Thu, 7 Apr 2022 22:24:05 +0800
From: Gao Xiang <xiang@kernel.org>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <Yk70BTzzoaOvET5c@debian>
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
References: <20220406075612.60298-1-jefflexu@linux.alibaba.com>
 <20220406075612.60298-18-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220406075612.60298-18-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Fri, 08 Apr 2022 10:44:29 +0000
Subject: Re: [Linux-cachefs] [PATCH v8 17/20] erofs: implement fscache-based
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 06, 2022 at 03:56:09PM +0800, Jeffle Xu wrote:
> Implement the data plane of reading data from data blobs over fscache
> for non-inline layout.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/erofs/fscache.c  | 52 +++++++++++++++++++++++++++++++++++++++++++++
>  fs/erofs/inode.c    |  5 +++++
>  fs/erofs/internal.h |  2 ++
>  3 files changed, 59 insertions(+)
> 
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> index 158cc273f8fb..65de1c754e80 100644
> --- a/fs/erofs/fscache.c
> +++ b/fs/erofs/fscache.c
> @@ -60,10 +60,62 @@ static int erofs_fscache_meta_readpage(struct file *data, struct page *page)
>  	return ret;
>  }
>  
> +static int erofs_fscache_readpage(struct file *file, struct page *page)
> +{
> +	struct folio *folio = page_folio(page);
> +	struct inode *inode = folio_file_mapping(folio)->host;
> +	struct super_block *sb = inode->i_sb;
> +	struct erofs_map_blocks map;
> +	struct erofs_map_dev mdev;
> +	erofs_off_t pos;
> +	loff_t pstart;
> +	int ret = 0;
> +
> +	DBG_BUGON(folio_size(folio) != EROFS_BLKSIZ);
> +
> +	pos = folio_pos(folio);
> +	map.m_la = pos;
> +
> +	ret = erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
> +	if (ret)
> +		goto out_unlock;
> +
> +	if (!(map.m_flags & EROFS_MAP_MAPPED)) {
> +		folio_zero_range(folio, 0, folio_size(folio));
> +		goto out_uptodate;
> +	}
> +
> +	/* no-inline readpage */
> +	mdev = (struct erofs_map_dev) {
> +		.m_deviceid = map.m_deviceid,
> +		.m_pa = map.m_pa,
> +	};
> +
> +	ret = erofs_map_dev(sb, &mdev);
> +	if (ret)
> +		goto out_unlock;
> +
> +	pstart = mdev.m_pa + (pos - map.m_la);
> +	ret = erofs_fscache_read_folios(mdev.m_fscache->cookie,
> +			folio_file_mapping(folio), folio_pos(folio),
> +			folio_size(folio), pstart);
> +
> +out_uptodate:
> +	if (!ret)
> +		folio_mark_uptodate(folio);
> +out_unlock:
> +	folio_unlock(folio);
> +	return ret;
> +}
> +
>  static const struct address_space_operations erofs_fscache_meta_aops = {
>  	.readpage = erofs_fscache_meta_readpage,
>  };
>  
> +const struct address_space_operations erofs_fscache_access_aops = {
> +	.readpage = erofs_fscache_readpage,
> +};
> +
>  /*
>   * Get the page cache of data blob at the index offset.
>   * Return: up to date page on success, ERR_PTR() on failure.
> diff --git a/fs/erofs/inode.c b/fs/erofs/inode.c
> index e8b37ba5e9ad..88b51b5fb53f 100644
> --- a/fs/erofs/inode.c
> +++ b/fs/erofs/inode.c
> @@ -296,7 +296,12 @@ static int erofs_fill_inode(struct inode *inode, int isdir)
>  		err = z_erofs_fill_inode(inode);
>  		goto out_unlock;
>  	}
> +

unnecessary modification.

Otherwise looks good:
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

>  	inode->i_mapping->a_ops = &erofs_raw_access_aops;
> +#ifdef CONFIG_EROFS_FS_ONDEMAND
> +	if (erofs_is_fscache_mode(inode->i_sb))
> +		inode->i_mapping->a_ops = &erofs_fscache_access_aops;
> +#endif
>  
>  out_unlock:
>  	erofs_put_metabuf(&buf);
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index e186051f0640..336d19647c96 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -642,6 +642,8 @@ int erofs_fscache_register_cookie(struct super_block *sb,
>  void erofs_fscache_unregister_cookie(struct erofs_fscache **fscache);
>  
>  struct folio *erofs_fscache_get_folio(struct super_block *sb, pgoff_t index);
> +
> +extern const struct address_space_operations erofs_fscache_access_aops;
>  #else
>  static inline int erofs_fscache_register_fs(struct super_block *sb) { return 0; }
>  static inline void erofs_fscache_unregister_fs(struct super_block *sb) {}
> -- 
> 2.27.0
> 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


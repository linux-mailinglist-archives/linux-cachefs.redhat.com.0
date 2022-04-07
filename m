Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9125A4F9335
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Apr 2022 12:44:35 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-IPD2yqW7OaGJFsZdaL74ug-1; Fri, 08 Apr 2022 06:44:33 -0400
X-MC-Unique: IPD2yqW7OaGJFsZdaL74ug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 097428041B6;
	Fri,  8 Apr 2022 10:44:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1A94C44AED;
	Fri,  8 Apr 2022 10:44:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A14B91940347;
	Fri,  8 Apr 2022 10:44:32 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ED1381947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 14:32:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4B54541637F; Thu,  7 Apr 2022 14:32:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47AF2416374
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 14:32:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D13AE80346E
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 14:32:14 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-cYf37xAmOaOs4gQGwTSudw-1; Thu, 07 Apr 2022 10:32:05 -0400
X-MC-Unique: cYf37xAmOaOs4gQGwTSudw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D6982B81D07;
 Thu,  7 Apr 2022 14:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DF6C385A0;
 Thu,  7 Apr 2022 14:31:57 +0000 (UTC)
Date: Thu, 7 Apr 2022 22:31:54 +0800
From: Gao Xiang <xiang@kernel.org>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <Yk712oM2xrEUmbhZ@debian>
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
 <20220406075612.60298-19-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220406075612.60298-19-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mailman-Approved-At: Fri, 08 Apr 2022 10:44:29 +0000
Subject: Re: [Linux-cachefs] [PATCH v8 18/20] erofs: implement fscache-based
 data read for inline layout
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 06, 2022 at 03:56:10PM +0800, Jeffle Xu wrote:
> Implement the data plane of reading data from data blobs over fscache
> for inline layout.
> 
> For the heading non-inline part, the data plane for non-inline layout is
> reused, while only the tail packing part needs special handling.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/erofs/fscache.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> index 65de1c754e80..d32cb5840c6d 100644
> --- a/fs/erofs/fscache.c
> +++ b/fs/erofs/fscache.c
> @@ -60,6 +60,40 @@ static int erofs_fscache_meta_readpage(struct file *data, struct page *page)
>  	return ret;
>  }
>  
> +static int erofs_fscache_readpage_inline(struct folio *folio,
> +					 struct erofs_map_blocks *map)
> +{
> +	struct inode *inode = folio_file_mapping(folio)->host;
> +	struct super_block *sb = inode->i_sb;
> +	struct erofs_buf buf = __EROFS_BUF_INITIALIZER;
> +	erofs_blk_t blknr;
> +	size_t offset, len;
> +	void *src, *dst;
> +
> +	/*
> +	 * For inline (tail packing) layout, the offset may be non-zero, which
> +	 * can be calculated from corresponding physical address directly.
> +	 */
> +	offset = erofs_blkoff(map->m_pa);
> +	blknr = erofs_blknr(map->m_pa);
> +	len = map->m_llen;
> +
> +	src = erofs_read_metabuf(&buf, sb, blknr, EROFS_KMAP);
> +	if (IS_ERR(src))
> +		return PTR_ERR(src);
> +
> +	DBG_BUGON(folio_size(folio) != PAGE_SIZE);
> +
> +	dst = kmap(folio_page(folio, 0));

kmap_local_folio?

> +	memcpy(dst, src + offset, len);
> +	memset(dst + len, 0, PAGE_SIZE - len);
> +	kunmap(folio_page(folio, 0));
> +
> +	erofs_put_metabuf(&buf);
> +
> +	return 0;
> +}
> +
>  static int erofs_fscache_readpage(struct file *file, struct page *page)
>  {
>  	struct folio *folio = page_folio(page);
> @@ -85,6 +119,12 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
>  		goto out_uptodate;
>  	}
>  
> +	/* inline readpage */

I think the code below is self-explained.

> +	if (map.m_flags & EROFS_MAP_META) {
> +		ret = erofs_fscache_readpage_inline(folio, &map);
> +		goto out_uptodate;
> +	}
> +
>  	/* no-inline readpage */

Same here.

Thanks,
Gao Xiang

>  	mdev = (struct erofs_map_dev) {
>  		.m_deviceid = map.m_deviceid,
> -- 
> 2.27.0
> 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


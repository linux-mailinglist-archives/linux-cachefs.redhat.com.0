Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D0548438E
	for <lists+linux-cachefs@lfdr.de>; Tue,  4 Jan 2022 15:41:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-XNhHA2LTMAyKX_IddwOsGg-1; Tue, 04 Jan 2022 09:41:13 -0500
X-MC-Unique: XNhHA2LTMAyKX_IddwOsGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CBD71932480;
	Tue,  4 Jan 2022 14:41:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52E197E8C5;
	Tue,  4 Jan 2022 14:41:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF6234BB7C;
	Tue,  4 Jan 2022 14:41:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 204Ef8A5024539 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 4 Jan 2022 09:41:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 323C82166B44; Tue,  4 Jan 2022 14:41:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BB292166B2F
	for <linux-cachefs@redhat.com>; Tue,  4 Jan 2022 14:41:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2E683C11A07
	for <linux-cachefs@redhat.com>; Tue,  4 Jan 2022 14:41:04 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
	(out30-54.freemail.mail.aliyun.com [115.124.30.54]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-171-sHmIyswEOB6vBM3VpdhzUQ-1; Tue, 04 Jan 2022 09:41:03 -0500
X-MC-Unique: sHmIyswEOB6vBM3VpdhzUQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R601e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
	MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
	TI=SMTPD_---0V0y0W7N_1641307254
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
	fp:SMTPD_---0V0y0W7N_1641307254) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 04 Jan 2022 22:40:56 +0800
Date: Tue, 4 Jan 2022 22:40:54 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <YdRcdqIUkqIIw6EP@B-P7TQMD6M-0146.local>
Mail-Followup-To: Jeffle Xu <jefflexu@linux.alibaba.com>,
	dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, tao.peng@linux.alibaba.com,
	gerry@linux.alibaba.com, eguan@linux.alibaba.com,
	linux-kernel@vger.kernel.org
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
	<20211227125444.21187-14-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20211227125444.21187-14-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: chao@kernel.org, tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	linux-cachefs@redhat.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, xiang@kernel.org,
	gerry@linux.alibaba.com, linux-erofs@lists.ozlabs.org,
	eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v1 13/23] erofs: implement fscache-based
	data read
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 27, 2021 at 08:54:34PM +0800, Jeffle Xu wrote:
> This patch implements the data plane of reading data from bootstrap blob
> file over fscache.
> 
> Be noted that currently compressed layout is not supported yet.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/erofs/fscache.c  | 91 +++++++++++++++++++++++++++++++++++++++++++++
>  fs/erofs/inode.c    |  6 ++-
>  fs/erofs/internal.h |  1 +
>  3 files changed, 97 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> index 325f5663836b..bfcec831d58a 100644
> --- a/fs/erofs/fscache.c
> +++ b/fs/erofs/fscache.c
> @@ -65,6 +65,97 @@ struct page *erofs_readpage_from_fscache(struct erofs_cookie_ctx *ctx,
>  	return page;
>  }
>  
> +static inline void do_copy_page(struct page *from, struct page *to,
> +				size_t offset, size_t len)
> +{
> +	char *vfrom, *vto;
> +
> +	vfrom = kmap_atomic(from);
> +	vto = kmap_atomic(to);
> +	memcpy(vto, vfrom + offset, len);
> +	kunmap_atomic(vto);
> +	kunmap_atomic(vfrom);
> +}
> +
> +static int erofs_fscache_do_readpage(struct file *file, struct page *page)
> +{
> +	struct inode *inode = page->mapping->host;
> +	struct erofs_inode *vi = EROFS_I(inode);
> +	struct super_block *sb = inode->i_sb;
> +	struct erofs_map_blocks map;
> +	erofs_off_t o_la, pa;
> +	size_t offset, len;
> +	struct page *ipage;
> +	int ret;
> +
> +	if (erofs_inode_is_data_compressed(vi->datalayout)) {
> +		erofs_info(sb, "compressed layout not supported yet");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	o_la = page_offset(page);
> +	map.m_la = o_la;
> +
> +	ret = erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
> +	if (ret)
> +		return ret;
> +
> +	if (!(map.m_flags & EROFS_MAP_MAPPED)) {
> +		zero_user(page, 0, PAGE_SIZE);
> +		return 0;
> +	}
> +
> +	/*
> +	 * 1) For FLAT_PLAIN/FLAT_INLINE layout, the output map.m_la shall be
> +	 * equal to o_la, and the output map.m_pa is exactly the physical
> +	 * address of o_la.
> +	 * 2) For CHUNK_BASED layout, the output map.m_la is rounded down to the
> +	 * nearest chunk boundary, and the output map.m_pa is actually the
> +	 * physical address of this chunk boundary. So we need to recalculate
> +	 * the actual physical address of o_la.
> +	 */
> +	pa = map.m_pa + o_la - map.m_la;
> +
> +	ipage = erofs_get_meta_page(sb, erofs_blknr(pa));
> +	if (IS_ERR(ipage))
> +		return PTR_ERR(ipage);
> +
> +	/*
> +	 * @offset refers to the page offset inside @ipage.
> +	 * 1) Except for the inline layout, the offset shall all be 0, and @pa
> +	 * shall be aligned with EROFS_BLKSIZ in this case. Thus we can
> +	 * conveniently get the offset from @pa.
> +	 * 2) While for the inline layout, the offset may be non-zero. Since
> +	 * currently only flat layout supports inline, we can calculate the
> +	 * offset from the corresponding physical address.
> +	 */
> +	offset = erofs_blkoff(pa);
> +	len = min_t(u64, map.m_llen, PAGE_SIZE);
> +
> +	do_copy_page(ipage, page, offset, len);

If my understanding is correct, I still have no idea why we need to
copy data here even if fscache can do direct I/O for us without extra
efforts.

I think the only case would be tail-packing inline (which should go
through metadata path), otherwise, all data is block-aligned. So
fscache can handle it directly.

Thanks,
Gao Xiang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7E94DBE2C
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Mar 2022 06:23:15 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-Rqp867wjP7GjdyB3YPVSJQ-1; Thu, 17 Mar 2022 01:23:11 -0400
X-MC-Unique: Rqp867wjP7GjdyB3YPVSJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C804185A7B2;
	Thu, 17 Mar 2022 05:23:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4F8A2022AB9;
	Thu, 17 Mar 2022 05:23:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6702A194036B;
	Thu, 17 Mar 2022 05:23:09 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B0356194035E for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 17 Mar 2022 05:23:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8C3B61427AFC; Thu, 17 Mar 2022 05:23:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 889CE1427AFB
 for <linux-cachefs@redhat.com>; Thu, 17 Mar 2022 05:23:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BF0F299E74B
 for <linux-cachefs@redhat.com>; Thu, 17 Mar 2022 05:23:08 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-RKL3Wv0jPkOVeB-pHBx5aw-1; Thu, 17 Mar 2022 01:23:04 -0400
X-MC-Unique: RKL3Wv0jPkOVeB-pHBx5aw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=17; SR=0; TI=SMTPD_---0V7QF66W_1647494576
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0V7QF66W_1647494576) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 17 Mar 2022 13:22:59 +0800
Date: Thu, 17 Mar 2022 13:22:56 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <YjLFsCLeEU9glmNf@B-P7TQMD6M-0146.local>
Mail-Followup-To: Jeffle Xu <jefflexu@linux.alibaba.com>,
 dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org,
 torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
 willy@infradead.org, linux-fsdevel@vger.kernel.org,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 tao.peng@linux.alibaba.com, gerry@linux.alibaba.com,
 eguan@linux.alibaba.com, linux-kernel@vger.kernel.org,
 luodaowen.backend@bytedance.com
References: <20220316131723.111553-1-jefflexu@linux.alibaba.com>
 <20220316131723.111553-22-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220316131723.111553-22-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH v5 21/22] erofs: implement fscache-based
 data readahead
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
Cc: linux-erofs@lists.ozlabs.org, chao@kernel.org, tao.peng@linux.alibaba.com,
 willy@infradead.org, linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 16, 2022 at 09:17:22PM +0800, Jeffle Xu wrote:
> This patch implements fscache-based data readahead. Also registers an
> individual bdi for each erofs instance to enable readahead.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/erofs/fscache.c | 153 +++++++++++++++++++++++++++++++++++++++++++++
>  fs/erofs/super.c   |   4 ++
>  2 files changed, 157 insertions(+)
> 
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> index 82c52b6e077e..913ca891deb9 100644
> --- a/fs/erofs/fscache.c
> +++ b/fs/erofs/fscache.c
> @@ -10,6 +10,13 @@ struct erofs_fscache_map {
>  	u64 m_llen;
>  };
>  
> +struct erofs_fscahce_ra_ctx {

typo,  should be `erofs_fscache_ra_ctx'

> +	struct readahead_control *rac;
> +	struct address_space *mapping;
> +	loff_t start;
> +	size_t len, done;
> +};
> +
>  static struct fscache_volume *volume;
>  
>  /*
> @@ -199,12 +206,158 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
>  	return ret;
>  }
>  
> +static inline size_t erofs_fscache_calc_len(struct erofs_fscahce_ra_ctx *ractx,
> +					    struct erofs_fscache_map *fsmap)
> +{
> +	/*
> +	 * 1) For CHUNK_BASED layout, the output m_la is rounded down to the
> +	 * nearest chunk boundary, and the output m_llen actually starts from
> +	 * the start of the containing chunk.
> +	 * 2) For other cases, the output m_la is equal to o_la.
> +	 */
> +	size_t len = fsmap->m_llen - (fsmap->o_la - fsmap->m_la);
> +
> +	return min_t(size_t, len, ractx->len - ractx->done);
> +}
> +
> +static inline void erofs_fscache_unlock_pages(struct readahead_control *rac,
> +					      size_t len)

Can we convert them into folios in advance? it seems much
straight-forward to convert these...

Or I have to convert them later, and it seems unnecessary...


> +{
> +	while (len) {
> +		struct page *page = readahead_page(rac);
> +
> +		SetPageUptodate(page);
> +		unlock_page(page);
> +		put_page(page);
> +
> +		len -= PAGE_SIZE;
> +	}
> +}
> +
> +static int erofs_fscache_ra_hole(struct erofs_fscahce_ra_ctx *ractx,
> +				 struct erofs_fscache_map *fsmap)
> +{
> +	struct iov_iter iter;
> +	loff_t start = ractx->start + ractx->done;
> +	size_t length = erofs_fscache_calc_len(ractx, fsmap);
> +
> +	iov_iter_xarray(&iter, READ, &ractx->mapping->i_pages, start, length);
> +	iov_iter_zero(length, &iter);
> +
> +	erofs_fscache_unlock_pages(ractx->rac, length);
> +	return length;
> +}
> +
> +static int erofs_fscache_ra_noinline(struct erofs_fscahce_ra_ctx *ractx,
> +				     struct erofs_fscache_map *fsmap)
> +{
> +	struct fscache_cookie *cookie = fsmap->m_ctx->cookie;
> +	loff_t start = ractx->start + ractx->done;
> +	size_t length = erofs_fscache_calc_len(ractx, fsmap);
> +	loff_t pstart = fsmap->m_pa + (fsmap->o_la - fsmap->m_la);
> +	int ret;
> +
> +	ret = erofs_fscache_read_pages(cookie, ractx->mapping,
> +				       start, length, pstart);
> +	if (!ret) {
> +		erofs_fscache_unlock_pages(ractx->rac, length);
> +		ret = length;
> +	}
> +
> +	return ret;
> +}
> +
> +static int erofs_fscache_ra_inline(struct erofs_fscahce_ra_ctx *ractx,
> +				   struct erofs_fscache_map *fsmap)
> +{

We could fold in this, since it has the only user.

Thanks,
Gao Xiang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


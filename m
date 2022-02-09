Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C81654AEB86
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Feb 2022 08:54:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-1FepPT6ROiWIuY2yCUCfrw-1; Wed, 09 Feb 2022 02:54:16 -0500
X-MC-Unique: 1FepPT6ROiWIuY2yCUCfrw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94D9285EE63;
	Wed,  9 Feb 2022 07:54:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12B5A7AB4C;
	Wed,  9 Feb 2022 07:54:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D13A6180BAAE;
	Wed,  9 Feb 2022 07:54:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2197r7Mq014501 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 9 Feb 2022 02:53:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4508D4010A07; Wed,  9 Feb 2022 07:53:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41121400E13A
	for <linux-cachefs@redhat.com>; Wed,  9 Feb 2022 07:53:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19547106655B
	for <linux-cachefs@redhat.com>; Wed,  9 Feb 2022 07:53:07 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
	(out30-56.freemail.mail.aliyun.com [115.124.30.56]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-466-QQWS2Nk2OaOgmsWbulcV4w-1; Wed, 09 Feb 2022 02:53:05 -0500
X-MC-Unique: QQWS2Nk2OaOgmsWbulcV4w-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
	MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=16; SR=0;
	TI=SMTPD_---0V3zwdmU_1644393177
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
	fp:SMTPD_---0V3zwdmU_1644393177) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 09 Feb 2022 15:52:59 +0800
Date: Wed, 9 Feb 2022 15:52:55 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <YgNy121L0gYjqj6K@B-P7TQMD6M-0146.local>
Mail-Followup-To: Jeffle Xu <jefflexu@linux.alibaba.com>,
	dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org,
	torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
	willy@infradead.org, linux-fsdevel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	tao.peng@linux.alibaba.com, gerry@linux.alibaba.com,
	eguan@linux.alibaba.com, linux-kernel@vger.kernel.org
References: <20220209060108.43051-1-jefflexu@linux.alibaba.com>
	<20220209060108.43051-7-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220209060108.43051-7-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-cachefs@redhat.com
Cc: linux-erofs@lists.ozlabs.org, chao@kernel.org, tao.peng@linux.alibaba.com,
	willy@infradead.org, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
	bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
	linux-fsdevel@vger.kernel.org, xiang@kernel.org,
	gerry@linux.alibaba.com, torvalds@linux-foundation.org,
	eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v3 06/22] erofs: use meta buffers for
 erofs_read_superblock()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 09, 2022 at 02:00:52PM +0800, Jeffle Xu wrote:
> The only change is that, meta buffers read cache page without __GFP_FS
> flag, which shall not matter.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

(If this patchset left behind anyway, I will submit this cleanup
 independently for the next cycle.)

Thanks,
Gao Xiang

> ---
>  fs/erofs/super.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index 915eefe0d7e2..12755217631f 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -281,21 +281,19 @@ static int erofs_init_devices(struct super_block *sb,
>  static int erofs_read_superblock(struct super_block *sb)
>  {
>  	struct erofs_sb_info *sbi;
> -	struct page *page;
> +	struct erofs_buf buf = __EROFS_BUF_INITIALIZER;
>  	struct erofs_super_block *dsb;
>  	unsigned int blkszbits;
>  	void *data;
>  	int ret;
>  
> -	page = read_mapping_page(sb->s_bdev->bd_inode->i_mapping, 0, NULL);
> -	if (IS_ERR(page)) {
> +	data = erofs_read_metabuf(&buf, sb, 0, EROFS_KMAP);
> +	if (IS_ERR(data)) {
>  		erofs_err(sb, "cannot read erofs superblock");
> -		return PTR_ERR(page);
> +		return PTR_ERR(data);
>  	}
>  
>  	sbi = EROFS_SB(sb);
> -
> -	data = kmap(page);
>  	dsb = (struct erofs_super_block *)(data + EROFS_SUPER_OFFSET);
>  
>  	ret = -EINVAL;
> @@ -365,8 +363,7 @@ static int erofs_read_superblock(struct super_block *sb)
>  	if (erofs_sb_has_ztailpacking(sbi))
>  		erofs_info(sb, "EXPERIMENTAL compressed inline data feature in use. Use at your own risk!");
>  out:
> -	kunmap(page);
> -	put_page(page);
> +	erofs_put_metabuf(&buf);
>  	return ret;
>  }
>  
> -- 
> 2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


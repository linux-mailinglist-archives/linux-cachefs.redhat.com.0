Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 776F050F070
	for <lists+linux-cachefs@lfdr.de>; Tue, 26 Apr 2022 07:43:18 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-wf593HmfN32c5AhGwXH4hg-1; Tue, 26 Apr 2022 01:43:14 -0400
X-MC-Unique: wf593HmfN32c5AhGwXH4hg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF9AF1014A60;
	Tue, 26 Apr 2022 05:43:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5878400F8F6;
	Tue, 26 Apr 2022 05:43:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7168B1949761;
	Tue, 26 Apr 2022 05:43:13 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DD6F919451F2 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 26 Apr 2022 05:43:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B7C8A400DE5E; Tue, 26 Apr 2022 05:43:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3E7440CF91F
 for <linux-cachefs@redhat.com>; Tue, 26 Apr 2022 05:43:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 994CC380450D
 for <linux-cachefs@redhat.com>; Tue, 26 Apr 2022 05:43:12 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-57nqRgm9OnKOtrJDfQu4_w-1; Tue, 26 Apr 2022 01:43:09 -0400
X-MC-Unique: 57nqRgm9OnKOtrJDfQu4_w-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=21; SR=0; TI=SMTPD_---0VBJMKCy_1650951781
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VBJMKCy_1650951781) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 26 Apr 2022 13:43:04 +0800
Date: Tue, 26 Apr 2022 13:43:01 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <YmeGZZHnbrQy4pnR@B-P7TQMD6M-0146.local>
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
 <20220425122143.56815-21-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220425122143.56815-21-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH v10 20/21] erofs: implement
 fscache-based data readahead
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 25, 2022 at 08:21:42PM +0800, Jeffle Xu wrote:
> Implement fscache-based data readahead. Also registers an individual
                                               ^ register

> bdi for each erofs instance to enable readahead.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

> ---
>  fs/erofs/fscache.c | 90 ++++++++++++++++++++++++++++++++++++++++++++++
>  fs/erofs/super.c   |  4 +++
>  2 files changed, 94 insertions(+)
> 
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> index 5b779812a5ee..a402d8f0a063 100644
> --- a/fs/erofs/fscache.c
> +++ b/fs/erofs/fscache.c
> @@ -162,12 +162,102 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
>  	return ret;
>  }
>  
> +static void erofs_fscache_unlock_folios(struct readahead_control *rac,
> +					size_t len)
> +{
> +	while (len) {
> +		struct folio *folio = readahead_folio(rac);
> +
> +		len -= folio_size(folio);
> +		folio_mark_uptodate(folio);
> +		folio_unlock(folio);
> +	}
> +}
> +
> +static void erofs_fscache_readahead(struct readahead_control *rac)
> +{
> +	struct inode *inode = rac->mapping->host;
> +	struct super_block *sb = inode->i_sb;
> +	size_t len, count, done = 0;
> +	erofs_off_t pos;
> +	loff_t start, offset;
> +	int ret;
> +
> +	if (!readahead_count(rac))
> +		return;
> +
> +	start = readahead_pos(rac);
> +	len = readahead_length(rac);
> +
> +	do {
> +		struct erofs_map_blocks map;
> +		struct erofs_map_dev mdev;
> +
> +		pos = start + done;
> +		map.m_la = pos;
> +
> +		ret = erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
> +		if (ret)
> +			return;
> +
> +		offset = start + done;
> +		count = min_t(size_t, map.m_llen - (pos - map.m_la),
> +			      len - done);
> +
> +		if (!(map.m_flags & EROFS_MAP_MAPPED)) {
> +			struct iov_iter iter;
> +
> +			iov_iter_xarray(&iter, READ, &rac->mapping->i_pages,
> +					offset, count);
> +			iov_iter_zero(count, &iter);
> +
> +			erofs_fscache_unlock_folios(rac, count);
> +			ret = count;
> +			continue;
> +		}
> +
> +		if (map.m_flags & EROFS_MAP_META) {
> +			struct folio *folio = readahead_folio(rac);
> +
> +			ret = erofs_fscache_readpage_inline(folio, &map);
> +			if (!ret) {
> +				folio_mark_uptodate(folio);
> +				ret = folio_size(folio);
> +			}
> +
> +			folio_unlock(folio);
> +			continue;
> +		}
> +
> +		mdev = (struct erofs_map_dev) {
> +			.m_deviceid = map.m_deviceid,
> +			.m_pa = map.m_pa,
> +		};
> +		ret = erofs_map_dev(sb, &mdev);
> +		if (ret)
> +			return;
> +
> +		ret = erofs_fscache_read_folios(mdev.m_fscache->cookie,
> +				rac->mapping, offset, count,
> +				mdev.m_pa + (pos - map.m_la));
> +		/*
> +		 * For the error cases, the folios will be unlocked when
> +		 * .readahead() returns.
> +		 */
> +		if (!ret) {
> +			erofs_fscache_unlock_folios(rac, count);
> +			ret = count;
> +		}
> +	} while (ret > 0 && ((done += ret) < len));
> +}
> +
>  static const struct address_space_operations erofs_fscache_meta_aops = {
>  	.readpage = erofs_fscache_meta_readpage,
>  };
>  
>  const struct address_space_operations erofs_fscache_access_aops = {
>  	.readpage = erofs_fscache_readpage,
> +	.readahead = erofs_fscache_readahead,
>  };
>  
>  int erofs_fscache_register_cookie(struct super_block *sb,
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index c6755bcae4a6..f68ba929100d 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -619,6 +619,10 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>  						    sbi->opt.fsid, true);
>  		if (err)
>  			return err;
> +
> +		err = super_setup_bdi(sb);
> +		if (err)
> +			return err;
>  	} else {
>  		if (!sb_set_blocksize(sb, EROFS_BLKSIZ)) {
>  			erofs_err(sb, "failed to set erofs blksize");
> -- 
> 2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


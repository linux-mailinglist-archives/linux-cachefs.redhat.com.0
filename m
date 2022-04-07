Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0BF4F9337
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Apr 2022 12:44:36 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-8HNSWtZjOuqK7Ybh7feE9w-1; Fri, 08 Apr 2022 06:44:34 -0400
X-MC-Unique: 8HNSWtZjOuqK7Ybh7feE9w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D57241801386;
	Fri,  8 Apr 2022 10:44:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D0DD416156;
	Fri,  8 Apr 2022 10:44:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CF1D61940354;
	Fri,  8 Apr 2022 10:44:31 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 722E51947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 14:36:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 538E8C27D8F; Thu,  7 Apr 2022 14:36:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FA7DC1D38B
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 14:36:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35A8083396A
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 14:36:56 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-VwH9iTdyPMKs1eEq9BYiqQ-1; Thu, 07 Apr 2022 10:36:54 -0400
X-MC-Unique: VwH9iTdyPMKs1eEq9BYiqQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0E6C4B82737;
 Thu,  7 Apr 2022 14:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75840C385A5;
 Thu,  7 Apr 2022 14:36:47 +0000 (UTC)
Date: Thu, 7 Apr 2022 22:36:42 +0800
From: Gao Xiang <xiang@kernel.org>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <Yk72+uwwg3/bG72X@debian>
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
 <20220406075612.60298-20-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220406075612.60298-20-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mailman-Approved-At: Fri, 08 Apr 2022 10:44:29 +0000
Subject: Re: [Linux-cachefs] [PATCH v8 19/20] erofs: implement fscache-based
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
Cc: tianzichen@kuaishou.com, linux-erofs@lists.ozlabs.org, chao@kernel.org,
 fannaihao@baidu.com, tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 06, 2022 at 03:56:11PM +0800, Jeffle Xu wrote:
> Implement fscache-based data readahead. Also registers an individual
> bdi for each erofs instance to enable readahead.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/erofs/fscache.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++
>  fs/erofs/super.c   |  4 ++
>  2 files changed, 98 insertions(+)
> 
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> index d32cb5840c6d..620d44210809 100644
> --- a/fs/erofs/fscache.c
> +++ b/fs/erofs/fscache.c
> @@ -148,12 +148,106 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
>  	return ret;
>  }
>  
> +static inline void erofs_fscache_unlock_folios(struct readahead_control *rac,
> +					       size_t len)
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
> +		/*
> +		 * 1) For CHUNK_BASED layout, the output m_la is rounded down to
> +		 * the nearest chunk boundary, and the output m_llen actually
> +		 * starts from the start of the containing chunk.
> +		 * 2) For other cases, the output m_la is equal to o_la.
> +		 */

I think such comment is really unneeded, we should calculate like below
as always. Also I don't find o_la here anymore.

> +		offset = start + done;
> +		count = min_t(size_t, map.m_llen - (pos - map.m_la), len - done);
> +
> +		/* Read-ahead Hole */
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
> +		/* Read-ahead Inline */

Unnecessary comment.

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
> +		/* Read-ahead No-inline */

Same here.

Thanks,
Gao Xiang

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
>  /*
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index 8c7181cd37e6..a5e4de60a0d8 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -621,6 +621,10 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>  						    sbi->opt.fsid, true);
>  		if (err)
>  			return err;
> +
> +		err = super_setup_bdi(sb);
> +		if (err)
> +			return err;
>  	}
>  
>  	err = erofs_read_superblock(sb);
> -- 
> 2.27.0
> 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


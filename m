Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B839433D41
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Oct 2021 19:23:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634664190;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TZNZcsD1crHgPjpUsvG2tqZ4g4Xn4sKF/diMuP+Sv4I=;
	b=WNGfV4Swnu5ZMkeF4mmEaTpRr6OEKh71ZZs/OUrlU83IM0dup8gPHWlBXCwo0AqeoNLpvm
	7eU9YX6hBsIsK0yc4dukgLOAthSxSvdFDHEJOfRGeSe/zuvD49d/d6jS2KXppWcH6sSbuU
	WbLF/t7c5bPvihkX7XmTfBB3lyUfmWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-a67GXcZrMwSBURZQ6oAx8A-1; Tue, 19 Oct 2021 13:23:07 -0400
X-MC-Unique: a67GXcZrMwSBURZQ6oAx8A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCCFB100CD00;
	Tue, 19 Oct 2021 17:23:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC54D5F4F5;
	Tue, 19 Oct 2021 17:23:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A8E11801241;
	Tue, 19 Oct 2021 17:23:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19JHN0Yv014775 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 19 Oct 2021 13:23:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CDFC7EAF9F; Tue, 19 Oct 2021 17:23:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C88F1F4EA6
	for <linux-cachefs@redhat.com>; Tue, 19 Oct 2021 17:22:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDC92810BCF
	for <linux-cachefs@redhat.com>; Tue, 19 Oct 2021 17:22:55 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
	[209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-243-b5E0ynsuM128Iv8zuy8JwA-1; Tue, 19 Oct 2021 13:22:52 -0400
X-MC-Unique: b5E0ynsuM128Iv8zuy8JwA-1
Received: by mail-qt1-f200.google.com with SMTP id
	c19-20020ac81e93000000b002a71180fd3dso448040qtm.1
	for <linux-cachefs@redhat.com>; Tue, 19 Oct 2021 10:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=JOqfmssTkXXiKThwBGVyyHuYXPo6VBVl8UwOszClJ8c=;
	b=Hb7xSTFDTL6ncme/ry5/NNE402vxYwaInVxGBmXq99eDR7wtUzlLO+OHa6FCcn4Pzp
	aFJjiSvKIcJBdzzdAhmDhipRmX1OHbkOm6QA+Hki5GkWU8j9T+H8RfWOL1J8T9iqUaJj
	xjBaTvDQZWpq0K5hlN/kfUyAue4noQVpV6KFIpN9tgZ3oEldY9hVdglr8zmAZISLc1bt
	3NOH5bpqtLpskIcl0dKVyckqcpAjjNxLOep2czVONhQH6eH5LEO5JaDdgq+j8OkBM/3F
	J+tQ3oAUbAQ50XTPJbj68OvdjLxObZZ1LSwVZckVLVH0O+VJhqFWHY+X9RGFzMsC5+nz
	qVVw==
X-Gm-Message-State: AOAM5310LriYM/0whcnv5QhOHBLZ6vgdKel9zYCls4OmexOpkv+0jBuB
	Ze2BCmslES3l8BidTbOzFaCJA9tONg7emzhv2WcTWPI5lw9rqhBUK7iXB9eXj5qvCFPlV5gLkYy
	4pzpenZwIB+N8NcqgA4o/3w==
X-Received: by 2002:ac8:5fc5:: with SMTP id k5mr1372079qta.273.1634664172094; 
	Tue, 19 Oct 2021 10:22:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzp4cr5dV94h+XDRbaJmp+cfMFv4+i32Ye0oINtZE8qF5SrO8m9PjQyUWjQRiUs6vWX+z8ww==
X-Received: by 2002:ac8:5fc5:: with SMTP id k5mr1372059qta.273.1634664171906; 
	Tue, 19 Oct 2021 10:22:51 -0700 (PDT)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
	[68.20.15.154]) by smtp.gmail.com with ESMTPSA id
	m66sm8127161qkb.87.2021.10.19.10.22.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Oct 2021 10:22:51 -0700 (PDT)
Message-ID: <d58335124c7467703201a9cdba765a46a780c855.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Tue, 19 Oct 2021 13:22:50 -0400
In-Reply-To: <163456866523.2614702.2234665737111683988.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
	<163456866523.2614702.2234665737111683988.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, Dominique,
	Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 03/67] vfs,
 fscache: Force ->write_inode() to occur if cookie pinned for
 writeback
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-10-18 at 15:51 +0100, David Howells wrote:
> Use an inode flag, I_PINNING_FSCACHE_WB, to indicate that a cookie is
> pinned in use by that inode for the purposes of writeback.
> 
> Pinning is necessary because the in-use pin from the open file is released
> before the writeback takes place, but if the resources aren't pinned, the
> dirty data can't be written to the cache.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
> 
>  fs/fs-writeback.c         |    8 ++++++++
>  include/linux/fs.h        |    3 +++
>  include/linux/fscache.h   |    1 +
>  include/linux/writeback.h |    1 +
>  4 files changed, 13 insertions(+)
> 
> diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> index 81ec192ce067..f3122831c4fe 100644
> --- a/fs/fs-writeback.c
> +++ b/fs/fs-writeback.c
> @@ -1666,6 +1666,13 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
>  
>  	if (mapping_tagged(mapping, PAGECACHE_TAG_DIRTY))
>  		inode->i_state |= I_DIRTY_PAGES;
> +	else if (unlikely(inode->i_state & I_PINNING_FSCACHE_WB)) {
> +		if (!(inode->i_state & I_DIRTY_PAGES)) {
> +			inode->i_state &= ~I_PINNING_FSCACHE_WB;
> +			wbc->unpinned_fscache_wb = true;
> +			dirty |= I_PINNING_FSCACHE_WB; /* Cause write_inode */
> +		}
> +	}

IDGI: how would I_PINNING_FSCACHE_WB get set in the first place? 

>  
>  	spin_unlock(&inode->i_lock);
>  
> @@ -1675,6 +1682,7 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
>  		if (ret == 0)
>  			ret = err;
>  	}
> +	wbc->unpinned_fscache_wb = false;
>  	trace_writeback_single_inode(inode, wbc, nr_to_write);
>  	return ret;
>  }
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 197493507744..336739fed3e9 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2420,6 +2420,8 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
>   *			Used to detect that mark_inode_dirty() should not move
>   * 			inode between dirty lists.
>   *
> + * I_PINNING_FSCACHE_WB	Inode is pinning an fscache object for writeback.
> + *
>   * Q: What is the difference between I_WILL_FREE and I_FREEING?
>   */
>  #define I_DIRTY_SYNC		(1 << 0)
> @@ -2442,6 +2444,7 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
>  #define I_CREATING		(1 << 15)
>  #define I_DONTCACHE		(1 << 16)
>  #define I_SYNC_QUEUED		(1 << 17)
> +#define I_PINNING_FSCACHE_WB	(1 << 18)
>  
>  #define I_DIRTY_INODE (I_DIRTY_SYNC | I_DIRTY_DATASYNC)
>  #define I_DIRTY (I_DIRTY_INODE | I_DIRTY_PAGES)
> diff --git a/include/linux/fscache.h b/include/linux/fscache.h
> index 01558d155799..ba4878b56717 100644
> --- a/include/linux/fscache.h
> +++ b/include/linux/fscache.h
> @@ -19,6 +19,7 @@
>  #include <linux/pagemap.h>
>  #include <linux/pagevec.h>
>  #include <linux/list_bl.h>
> +#include <linux/writeback.h>
>  #include <linux/netfs.h>
>  
>  #if defined(CONFIG_FSCACHE) || defined(CONFIG_FSCACHE_MODULE)
> diff --git a/include/linux/writeback.h b/include/linux/writeback.h
> index d1f65adf6a26..2fda288600d3 100644
> --- a/include/linux/writeback.h
> +++ b/include/linux/writeback.h
> @@ -69,6 +69,7 @@ struct writeback_control {
>  	unsigned for_reclaim:1;		/* Invoked from the page allocator */
>  	unsigned range_cyclic:1;	/* range_start is cyclic */
>  	unsigned for_sync:1;		/* sync(2) WB_SYNC_ALL writeback */
> +	unsigned unpinned_fscache_wb:1;	/* Cleared I_PINNING_FSCACHE_WB */
>  
>  	/*
>  	 * When writeback IOs are bounced through async layers, only the
> 
> 

-- 
Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


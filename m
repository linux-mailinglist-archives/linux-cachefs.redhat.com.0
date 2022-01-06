Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7C348695D
	for <lists+linux-cachefs@lfdr.de>; Thu,  6 Jan 2022 19:04:48 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-9IuHgMxDMZGuWhgAj8W4uw-1; Thu, 06 Jan 2022 13:04:43 -0500
X-MC-Unique: 9IuHgMxDMZGuWhgAj8W4uw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49F5610168CB;
	Thu,  6 Jan 2022 18:04:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E419A10841E3;
	Thu,  6 Jan 2022 18:04:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB33B4BB7C;
	Thu,  6 Jan 2022 18:04:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 206I4ash011889 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 6 Jan 2022 13:04:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2286B2166B4C; Thu,  6 Jan 2022 18:04:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DBEE2166B44
	for <linux-cachefs@redhat.com>; Thu,  6 Jan 2022 18:04:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29A101C04B58
	for <linux-cachefs@redhat.com>; Thu,  6 Jan 2022 18:04:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
	[139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-587-yBumA0d2P-iZ7DCP1De7zg-1; Thu, 06 Jan 2022 13:04:29 -0500
X-MC-Unique: yBumA0d2P-iZ7DCP1De7zg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 77A8D61D42;
	Thu,  6 Jan 2022 18:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6642AC36AE3;
	Thu,  6 Jan 2022 18:04:26 +0000 (UTC)
Message-ID: <94b5163b0652c6106aa01a0f4c03bdf57c0a7e71.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Thu, 06 Jan 2022 13:04:25 -0500
In-Reply-To: <164021552299.640689.10578652796777392062.stgit@warthog.procyon.org.uk>
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
	<164021552299.640689.10578652796777392062.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, Dominique,
	Torvalds <torvalds@linux-foundation.org>,
	Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net,
	Omar Sandoval <osandov@osandov.com>, Linus,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 46/68] cachefiles: Mark a backing
 file in use with an inode flag
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2021-12-22 at 23:25 +0000, David Howells wrote:
> Use an inode flag, S_KERNEL_FILE, to mark that a backing file is in use by
> the kernel to prevent cachefiles or other kernel services from interfering
> with that file.
> 
> Using S_SWAPFILE instead isn't really viable as that has other effects in
> the I/O paths.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-cachefs@redhat.com
> Link: https://lore.kernel.org/r/163819642273.215744.6414248677118690672.stgit@warthog.procyon.org.uk/ # v1
> Link: https://lore.kernel.org/r/163906943215.143852.16972351425323967014.stgit@warthog.procyon.org.uk/ # v2
> Link: https://lore.kernel.org/r/163967154118.1823006.13227551961786743991.stgit@warthog.procyon.org.uk/ # v3
> ---
> 
>  fs/cachefiles/internal.h |    2 ++
>  fs/cachefiles/namei.c    |   35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
> index 01071e7a7c02..7c67a70a3dff 100644
> --- a/fs/cachefiles/internal.h
> +++ b/fs/cachefiles/internal.h
> @@ -187,6 +187,8 @@ extern struct kmem_cache *cachefiles_object_jar;
>  /*
>   * namei.c
>   */
> +extern void cachefiles_unmark_inode_in_use(struct cachefiles_object *object,
> +					   struct file *file);
>  extern struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
>  					       struct dentry *dir,
>  					       const char *name,
> diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
> index 11a33209ab5f..db60a671c3fc 100644
> --- a/fs/cachefiles/namei.c
> +++ b/fs/cachefiles/namei.c
> @@ -31,6 +31,18 @@ static bool __cachefiles_mark_inode_in_use(struct cachefiles_object *object,
>  	return can_use;
>  }
>  
> +static bool cachefiles_mark_inode_in_use(struct cachefiles_object *object,
> +					 struct dentry *dentry)
> +{
> +	struct inode *inode = d_backing_inode(dentry);
> +	bool can_use;
> +
> +	inode_lock(inode);
> +	can_use = __cachefiles_mark_inode_in_use(object, dentry);
> +	inode_unlock(inode);
> +	return can_use;
> +}
> +
>  /*
>   * Unmark a backing inode.  The caller must hold the inode lock.
>   */
> @@ -43,6 +55,29 @@ static void __cachefiles_unmark_inode_in_use(struct cachefiles_object *object,
>  	trace_cachefiles_mark_inactive(object, inode);
>  }
>  
> +/*
> + * Unmark a backing inode and tell cachefilesd that there's something that can
> + * be culled.
> + */
> +void cachefiles_unmark_inode_in_use(struct cachefiles_object *object,
> +				    struct file *file)
> +{
> +	struct cachefiles_cache *cache = object->volume->cache;
> +	struct inode *inode = file_inode(file);
> +
> +	if (inode) {
> +		inode_lock(inode);
> +		__cachefiles_unmark_inode_in_use(object, file->f_path.dentry);
> +		inode_unlock(inode);
> +
> +		if (!test_bit(CACHEFILES_OBJECT_USING_TMPFILE, &object->flags)) {
> +			atomic_long_add(inode->i_blocks, &cache->b_released);
> +			if (atomic_inc_return(&cache->f_released))
> +				cachefiles_state_changed(cache);
> +		}
> +	}
> +}
> +
>  /*
>   * get a subdirectory
>   */
> 
> 

Probably, this patch should be merged with #38. The commit logs are the
same, and they are at least somewhat related.

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


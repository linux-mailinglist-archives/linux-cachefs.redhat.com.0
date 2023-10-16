Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6217CAE63
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Oct 2023 17:57:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697471841;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TTYVds05RGoGr6QpJ0B1oTs+ntlY/AuKU2N1nwF0A7M=;
	b=hVgQpyCbSjGZtGUiqMLG15sSAmegyjZ2y0PjmeLuUg5q8sj6KgDfBw6BoBAFBlaXLqjUsd
	dMKSSqKg3XYQoRIwRVhLGWvhBmFaz7ZP0Ah5EJRgtQOjQVbvMG3B4+Qt9qvuvHC1UBGHo3
	K/OnlBaNKfi1XNeKyLGhJAroG/0G8m0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-677-_vzx3znZPmmZXz87NvU0pg-1; Mon, 16 Oct 2023 11:57:18 -0400
X-MC-Unique: _vzx3znZPmmZXz87NvU0pg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59D763821364;
	Mon, 16 Oct 2023 15:57:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32503492BFC;
	Mon, 16 Oct 2023 15:57:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C0AF3194658C;
	Mon, 16 Oct 2023 15:57:16 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A7D8F1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 16 Oct 2023 15:57:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8C16D63F48; Mon, 16 Oct 2023 15:57:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84A5E63F21
 for <linux-cachefs@redhat.com>; Mon, 16 Oct 2023 15:57:15 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3827F3C23647
 for <linux-cachefs@redhat.com>; Mon, 16 Oct 2023 15:57:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-X6_uoJVUPK-MpjK4RWRiHQ-1; Mon, 16 Oct 2023 11:57:01 -0400
X-MC-Unique: X6_uoJVUPK-MpjK4RWRiHQ-1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A102360FA5;
 Mon, 16 Oct 2023 15:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994FEC433C8;
 Mon, 16 Oct 2023 15:56:58 +0000 (UTC)
Message-ID: <e1351696345351cb3d168fb41c54a1ef8ccf0b16.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, Steve French <smfrench@gmail.com>
Date: Mon, 16 Oct 2023 11:56:57 -0400
In-Reply-To: <20231013160423.2218093-10-dhowells@redhat.com>
References: <20231013160423.2218093-1-dhowells@redhat.com>
 <20231013160423.2218093-10-dhowells@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Linux-cachefs] [RFC PATCH 09/53] netfs: Implement
 unbuffered/DIO vs buffered I/O locking
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
Cc: Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Shyam Prasad N <sprasad@microsoft.com>, v9fs@lists.linux.dev,
 netdev@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, linux-fsdevel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-mm@kvack.org,
 Marc Dionne <marc.dionne@auristor.com>, Ilya Dryomov <idryomov@gmail.com>,
 linux-afs@lists.infradead.org, Christian Brauner <christian@brauner.io>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2023-10-13 at 17:03 +0100, David Howells wrote:
> Borrow NFS's direct-vs-buffered I/O locking into netfslib.  Similar code is
> also used in ceph.
> 
> Modify it to have the correct checker annotations for i_rwsem lock
> acquisition/release and to return -ERESTARTSYS if waits are interrupted.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: linux-cachefs@redhat.com
> cc: linux-fsdevel@vger.kernel.org
> cc: linux-mm@kvack.org
> ---
>  fs/netfs/Makefile     |   1 +
>  fs/netfs/locking.c    | 209 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/netfs.h |  10 ++
>  3 files changed, 220 insertions(+)
>  create mode 100644 fs/netfs/locking.c
> 
> diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
> index cd22554d9048..647ce1935674 100644
> --- a/fs/netfs/Makefile
> +++ b/fs/netfs/Makefile
> @@ -4,6 +4,7 @@ netfs-y := \
>  	buffered_read.o \
>  	io.o \
>  	iterator.o \
> +	locking.o \
>  	main.o \
>  	misc.o \
>  	objects.o
> diff --git a/fs/netfs/locking.c b/fs/netfs/locking.c
> new file mode 100644
> index 000000000000..fecca8ea6322
> --- /dev/null
> +++ b/fs/netfs/locking.c
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * I/O and data path helper functionality.
> + *
> + * Borrowed from NFS Copyright (c) 2016 Trond Myklebust
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/netfs.h>
> +
> +/*
> + * inode_dio_wait_interruptible - wait for outstanding DIO requests to finish
> + * @inode: inode to wait for
> + *
> + * Waits for all pending direct I/O requests to finish so that we can
> + * proceed with a truncate or equivalent operation.
> + *
> + * Must be called under a lock that serializes taking new references
> + * to i_dio_count, usually by inode->i_mutex.
> + */
> +static int inode_dio_wait_interruptible(struct inode *inode)
> +{
> +	if (!atomic_read(&inode->i_dio_count))
> +		return 0;
> +
> +	wait_queue_head_t *wq = bit_waitqueue(&inode->i_state, __I_DIO_WAKEUP);
> +	DEFINE_WAIT_BIT(q, &inode->i_state, __I_DIO_WAKEUP);
> +
> +	for (;;) {
> +		prepare_to_wait(wq, &q.wq_entry, TASK_INTERRUPTIBLE);
> +		if (!atomic_read(&inode->i_dio_count))
> +			break;
> +		if (signal_pending(current))
> +			break;
> +		schedule();
> +	}
> +	finish_wait(wq, &q.wq_entry);
> +
> +	return atomic_read(&inode->i_dio_count) ? -ERESTARTSYS : 0;
> +}
> +
> +/* Call with exclusively locked inode->i_rwsem */
> +static int netfs_block_o_direct(struct netfs_inode *ictx)
> +{
> +	if (!test_bit(NETFS_ICTX_ODIRECT, &ictx->flags))
> +		return 0;
> +	clear_bit(NETFS_ICTX_ODIRECT, &ictx->flags);
> +	return inode_dio_wait_interruptible(&ictx->inode);
> +}
> +
> +/**
> + * netfs_start_io_read - declare the file is being used for buffered reads
> + * @inode: file inode
> + *
> + * Declare that a buffered read operation is about to start, and ensure
> + * that we block all direct I/O.
> + * On exit, the function ensures that the NETFS_ICTX_ODIRECT flag is unset,
> + * and holds a shared lock on inode->i_rwsem to ensure that the flag
> + * cannot be changed.
> + * In practice, this means that buffered read operations are allowed to
> + * execute in parallel, thanks to the shared lock, whereas direct I/O
> + * operations need to wait to grab an exclusive lock in order to set
> + * NETFS_ICTX_ODIRECT.
> + * Note that buffered writes and truncates both take a write lock on
> + * inode->i_rwsem, meaning that those are serialised w.r.t. the reads.
> + */
> +int netfs_start_io_read(struct inode *inode)
> +	__acquires(inode->i_rwsem)
> +{
> +	struct netfs_inode *ictx = netfs_inode(inode);
> +
> +	/* Be an optimist! */
> +	if (down_read_interruptible(&inode->i_rwsem) < 0)
> +		return -ERESTARTSYS;
> +	if (test_bit(NETFS_ICTX_ODIRECT, &ictx->flags) == 0)
> +		return 0;
> +	up_read(&inode->i_rwsem);
> +
> +	/* Slow path.... */
> +	if (down_write_killable(&inode->i_rwsem) < 0)
> +		return -ERESTARTSYS;
> +	if (netfs_block_o_direct(ictx) < 0) {
> +		up_write(&inode->i_rwsem);
> +		return -ERESTARTSYS;
> +	}
> +	downgrade_write(&inode->i_rwsem);
> +	return 0;
> +}
> +
> +/**
> + * netfs_end_io_read - declare that the buffered read operation is done
> + * @inode: file inode
> + *
> + * Declare that a buffered read operation is done, and release the shared
> + * lock on inode->i_rwsem.
> + */
> +void netfs_end_io_read(struct inode *inode)
> +	__releases(inode->i_rwsem)
> +{
> +	up_read(&inode->i_rwsem);
> +}
> +
> +/**
> + * netfs_start_io_write - declare the file is being used for buffered writes
> + * @inode: file inode
> + *
> + * Declare that a buffered read operation is about to start, and ensure
> + * that we block all direct I/O.
> + */
> +int netfs_start_io_write(struct inode *inode)
> +	__acquires(inode->i_rwsem)
> +{
> +	struct netfs_inode *ictx = netfs_inode(inode);
> +
> +	if (down_write_killable(&inode->i_rwsem) < 0)
> +		return -ERESTARTSYS;
> +	if (netfs_block_o_direct(ictx) < 0) {
> +		up_write(&inode->i_rwsem);
> +		return -ERESTARTSYS;
> +	}
> +	return 0;
> +}
> +
> +/**
> + * netfs_end_io_write - declare that the buffered write operation is done
> + * @inode: file inode
> + *
> + * Declare that a buffered write operation is done, and release the
> + * lock on inode->i_rwsem.
> + */
> +void netfs_end_io_write(struct inode *inode)
> +	__releases(inode->i_rwsem)
> +{
> +	up_write(&inode->i_rwsem);
> +}
> +
> +/* Call with exclusively locked inode->i_rwsem */
> +static int netfs_block_buffered(struct inode *inode)
> +{
> +	struct netfs_inode *ictx = netfs_inode(inode);
> +	int ret;
> +
> +	if (!test_bit(NETFS_ICTX_ODIRECT, &ictx->flags)) {
> +		set_bit(NETFS_ICTX_ODIRECT, &ictx->flags);
> +		if (inode->i_mapping->nrpages != 0) {
> +			unmap_mapping_range(inode->i_mapping, 0, 0, 0);
> +			ret = filemap_fdatawait(inode->i_mapping);
> +			if (ret < 0) {
> +				clear_bit(NETFS_ICTX_ODIRECT, &ictx->flags);
> +				return ret;
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +
> +/**
> + * netfs_start_io_direct - declare the file is being used for direct i/o
> + * @inode: file inode
> + *
> + * Declare that a direct I/O operation is about to start, and ensure
> + * that we block all buffered I/O.
> + * On exit, the function ensures that the NETFS_ICTX_ODIRECT flag is set,
> + * and holds a shared lock on inode->i_rwsem to ensure that the flag
> + * cannot be changed.
> + * In practice, this means that direct I/O operations are allowed to
> + * execute in parallel, thanks to the shared lock, whereas buffered I/O
> + * operations need to wait to grab an exclusive lock in order to clear
> + * NETFS_ICTX_ODIRECT.
> + * Note that buffered writes and truncates both take a write lock on
> + * inode->i_rwsem, meaning that those are serialised w.r.t. O_DIRECT.
> + */
> +int netfs_start_io_direct(struct inode *inode)
> +	__acquires(inode->i_rwsem)
> +{
> +	struct netfs_inode *ictx = netfs_inode(inode);
> +	int ret;
> +
> +	/* Be an optimist! */
> +	if (down_read_interruptible(&inode->i_rwsem) < 0)
> +		return -ERESTARTSYS;
> +	if (test_bit(NETFS_ICTX_ODIRECT, &ictx->flags) != 0)
> +		return 0;
> +	up_read(&inode->i_rwsem);
> +
> +	/* Slow path.... */
> +	if (down_write_killable(&inode->i_rwsem) < 0)
> +		return -ERESTARTSYS;
> +	ret = netfs_block_buffered(inode);
> +	if (ret < 0) {
> +		up_write(&inode->i_rwsem);
> +		return ret;
> +	}
> +	downgrade_write(&inode->i_rwsem);
> +	return 0;
> +}
> +
> +/**
> + * netfs_end_io_direct - declare that the direct i/o operation is done
> + * @inode: file inode
> + *
> + * Declare that a direct I/O operation is done, and release the shared
> + * lock on inode->i_rwsem.
> + */
> +void netfs_end_io_direct(struct inode *inode)
> +	__releases(inode->i_rwsem)
> +{
> +	up_read(&inode->i_rwsem);
> +}
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index 02e888c170da..33d4487a91e9 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -131,6 +131,8 @@ struct netfs_inode {
>  	loff_t			remote_i_size;	/* Size of the remote file */
>  	loff_t			zero_point;	/* Size after which we assume there's no data
>  						 * on the server */
> +	unsigned long		flags;
> +#define NETFS_ICTX_ODIRECT	0		/* The file has DIO in progress */
>  };
>  
>  /*
> @@ -315,6 +317,13 @@ ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
>  				struct iov_iter *new,
>  				iov_iter_extraction_t extraction_flags);
>  
> +int netfs_start_io_read(struct inode *inode);
> +void netfs_end_io_read(struct inode *inode);
> +int netfs_start_io_write(struct inode *inode);
> +void netfs_end_io_write(struct inode *inode);
> +int netfs_start_io_direct(struct inode *inode);
> +void netfs_end_io_direct(struct inode *inode);
> +
>  /**
>   * netfs_inode - Get the netfs inode context from the inode
>   * @inode: The inode to query
> @@ -341,6 +350,7 @@ static inline void netfs_inode_init(struct netfs_inode *ctx,
>  	ctx->ops = ops;
>  	ctx->remote_i_size = i_size_read(&ctx->inode);
>  	ctx->zero_point = ctx->remote_i_size;
> +	ctx->flags = 0;
>  #if IS_ENABLED(CONFIG_FSCACHE)
>  	ctx->cache = NULL;
>  #endif
> 

It's nice to see this go into common code, but why not go ahead and
convert ceph (and possibly NFS) to use this? Is there any reason not to?

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


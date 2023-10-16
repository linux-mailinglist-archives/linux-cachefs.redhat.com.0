Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7335A7CAE9C
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Oct 2023 18:11:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697472670;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ePOYt2eUf2k7jvpJEZTQZt7l2WxMBp+8hGATqXvPHF0=;
	b=btY9m3pcuZHLHWkuc+ebohvXm7TEjBr/d5MnHjZe4ebbex+HdbQfm/UgluMU94MTrsVtdz
	9hjT+BqPYrNRCuvQGNLjh+aIGLrtqIFzkThAxoDQAGiQdKjz95Ak0nRtkWJFUAs9f4Za0A
	Zd8VLFGXeJO5gzU1H3B2Ml9DAK9enns=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-OhU6o80JMBC_hmjwiidn1g-1; Mon, 16 Oct 2023 12:11:02 -0400
X-MC-Unique: OhU6o80JMBC_hmjwiidn1g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0547E81DBEB;
	Mon, 16 Oct 2023 16:11:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ECA01492BEE;
	Mon, 16 Oct 2023 16:10:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BD868194658C;
	Mon, 16 Oct 2023 16:10:59 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BD94A1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 16 Oct 2023 16:10:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B0368492BFA; Mon, 16 Oct 2023 16:10:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9660492BFC
 for <linux-cachefs@redhat.com>; Mon, 16 Oct 2023 16:10:58 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A3CD29ABA24
 for <linux-cachefs@redhat.com>; Mon, 16 Oct 2023 16:10:58 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-280-WZVFny7UOsmTcPxe5sdhNA-1; Mon,
 16 Oct 2023 12:10:56 -0400
X-MC-Unique: WZVFny7UOsmTcPxe5sdhNA-1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2AFF3CE181B;
 Mon, 16 Oct 2023 16:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6700C433C9;
 Mon, 16 Oct 2023 16:10:50 +0000 (UTC)
Message-ID: <bb0b02b4241da7f486cde28bdc83bb9ce077ee0e.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, Steve French <smfrench@gmail.com>
Date: Mon, 16 Oct 2023 12:10:49 -0400
In-Reply-To: <20231013160423.2218093-12-dhowells@redhat.com>
References: <20231013160423.2218093-1-dhowells@redhat.com>
 <20231013160423.2218093-12-dhowells@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Subject: Re: [Linux-cachefs] [RFC PATCH 11/53] netfs: Add support for DIO
 buffering
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2023-10-13 at 17:03 +0100, David Howells wrote:
> Add a bvec array pointer and an iterator to netfs_io_request for either
> holding a copy of a DIO iterator or a list of all the bits of buffer
> pointed to by a DIO iterator.
> 
> There are two problems:  Firstly, if an iovec-class iov_iter is passed to
> ->read_iter() or ->write_iter(), this cannot be passed directly to
> kernel_sendmsg() or kernel_recvmsg() as that may cause locking recursion if
> a fault is generated, so we need to keep track of the pages involved
> separately.
> 
> Secondly, if the I/O is asynchronous, we must copy the iov_iter describing
> the buffer before returning to the caller as it may be immediately
> deallocated.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: linux-cachefs@redhat.com
> cc: linux-fsdevel@vger.kernel.org
> cc: linux-mm@kvack.org
> ---
>  fs/netfs/objects.c    | 10 ++++++++++
>  include/linux/netfs.h |  3 +++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
> index 8e92b8401aaa..4396318081bf 100644
> --- a/fs/netfs/objects.c
> +++ b/fs/netfs/objects.c
> @@ -78,6 +78,7 @@ static void netfs_free_request(struct work_struct *work)
>  {
>  	struct netfs_io_request *rreq =
>  		container_of(work, struct netfs_io_request, work);
> +	unsigned int i;
>  
>  	trace_netfs_rreq(rreq, netfs_rreq_trace_free);
>  	netfs_proc_del_rreq(rreq);
> @@ -86,6 +87,15 @@ static void netfs_free_request(struct work_struct *work)
>  		rreq->netfs_ops->free_request(rreq);
>  	if (rreq->cache_resources.ops)
>  		rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
> +	if (rreq->direct_bv) {
> +		for (i = 0; i < rreq->direct_bv_count; i++) {
> +			if (rreq->direct_bv[i].bv_page) {
> +				if (rreq->direct_bv_unpin)
> +					unpin_user_page(rreq->direct_bv[i].bv_page);
> +			}
> +		}
> +		kvfree(rreq->direct_bv);
> +	}
>  	kfree_rcu(rreq, rcu);
>  	netfs_stat_d(&netfs_n_rh_rreq);
>  }
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index bd0437088f0e..66479a61ad00 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -191,7 +191,9 @@ struct netfs_io_request {
>  	struct list_head	subrequests;	/* Contributory I/O operations */
>  	struct iov_iter		iter;		/* Unencrypted-side iterator */
>  	struct iov_iter		io_iter;	/* I/O (Encrypted-side) iterator */
> +	struct bio_vec		*direct_bv;	/* DIO buffer list (when handling iovec-iter) */
>  	void			*netfs_priv;	/* Private data for the netfs */
> +	unsigned int		direct_bv_count; /* Number of elements in bv[] */

nit: "number of elements in direct_bv[]"

Also, just for better readability, can you swap direct_bv and
netfs_priv? Then at least the array and count are together.

>  	unsigned int		debug_id;
>  	unsigned int		rsize;		/* Maximum read size (0 for none) */
>  	atomic_t		nr_outstanding;	/* Number of ops in progress */
> @@ -200,6 +202,7 @@ struct netfs_io_request {
>  	size_t			len;		/* Length of the request */
>  	short			error;		/* 0 or error that occurred */
>  	enum netfs_io_origin	origin;		/* Origin of the request */
> +	bool			direct_bv_unpin; /* T if direct_bv[] must be unpinned */
>  	loff_t			i_size;		/* Size of the file */
>  	loff_t			start;		/* Start position */
>  	pgoff_t			no_unlock_folio; /* Don't unlock this folio after read */
> 

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


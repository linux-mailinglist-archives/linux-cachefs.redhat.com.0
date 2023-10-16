Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1773F7CAE4B
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Oct 2023 17:55:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697471705;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4F9goQGk/wkyhRVtzB8lmlCZTvwj5tHtUAPlxYaU6WE=;
	b=OYXYjtGnDHbdeINCeqye+pdONkSflXGEP79tn/e0ljX5x0w3U0oxY7W1jUatiR1CZRduT0
	Jv04rq+SOC+hek9JQ3cBf34bpIvzw7X2hJPKRT7oAiNMqkXhMSJ7akDr1h0rBd4om6uOf4
	jfPtBoTK7RFelhzG6CHGT7+RBFsmqVo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-jHTEdHnYNzOEqf8BaXNdvg-1; Mon, 16 Oct 2023 11:55:01 -0400
X-MC-Unique: jHTEdHnYNzOEqf8BaXNdvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2563838145A0;
	Mon, 16 Oct 2023 15:54:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B21225C9;
	Mon, 16 Oct 2023 15:54:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E09ED194658C;
	Mon, 16 Oct 2023 15:54:58 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5F4391946587 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 16 Oct 2023 15:54:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 47C6725C9; Mon, 16 Oct 2023 15:54:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FCE725C8
 for <linux-cachefs@redhat.com>; Mon, 16 Oct 2023 15:54:57 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B69D862F4E
 for <linux-cachefs@redhat.com>; Mon, 16 Oct 2023 15:54:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-MYOWZgClOaOQ9oUvfUMaQg-1; Mon, 16 Oct 2023 11:54:48 -0400
X-MC-Unique: MYOWZgClOaOQ9oUvfUMaQg-1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1847F61010;
 Mon, 16 Oct 2023 15:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031F5C433C9;
 Mon, 16 Oct 2023 15:54:45 +0000 (UTC)
Message-ID: <be2434a2d51900b9e51d8bf0fe5a8b82e3f1a879.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, Steve French <smfrench@gmail.com>
Date: Mon, 16 Oct 2023 11:54:44 -0400
In-Reply-To: <20231013160423.2218093-9-dhowells@redhat.com>
References: <20231013160423.2218093-1-dhowells@redhat.com>
 <20231013160423.2218093-9-dhowells@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Subject: Re: [Linux-cachefs] [RFC PATCH 08/53] netfs: Add rsize to
 netfs_io_request
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2023-10-13 at 17:03 +0100, David Howells wrote:
> Add an rsize parameter to netfs_io_request to be filled in by the network
> filesystem when the request is initialised.  This indicates the maximum
> size of a read request that the netfs will honour in that region.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: linux-cachefs@redhat.com
> cc: linux-fsdevel@vger.kernel.org
> cc: linux-mm@kvack.org
> ---
>  fs/afs/file.c         | 1 +
>  fs/ceph/addr.c        | 2 ++
>  include/linux/netfs.h | 1 +
>  3 files changed, 4 insertions(+)
> 
> diff --git a/fs/afs/file.c b/fs/afs/file.c
> index 3fea5cd8ef13..3d2e1913ea27 100644
> --- a/fs/afs/file.c
> +++ b/fs/afs/file.c
> @@ -360,6 +360,7 @@ static int afs_symlink_read_folio(struct file *file, struct folio *folio)
>  static int afs_init_request(struct netfs_io_request *rreq, struct file *file)
>  {
>  	rreq->netfs_priv = key_get(afs_file_key(file));
> +	rreq->rsize = 4 * 1024 * 1024;
>  	return 0;
>  }
>  
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index ced19ff08988..92a5ddcd9a76 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -419,6 +419,8 @@ static int ceph_init_request(struct netfs_io_request *rreq, struct file *file)
>  	struct ceph_netfs_request_data *priv;
>  	int ret = 0;
>  
> +	rreq->rsize = 1024 * 1024;
> +

Holy magic numbers, batman! I think this deserves a comment that
explains how you came up with these values.

Also, do 9p and cifs not need this for some reason?

>  	if (rreq->origin != NETFS_READAHEAD)
>  		return 0;
>  
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index daa431c4148d..02e888c170da 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -188,6 +188,7 @@ struct netfs_io_request {
>  	struct list_head	subrequests;	/* Contributory I/O operations */
>  	void			*netfs_priv;	/* Private data for the netfs */
>  	unsigned int		debug_id;
> +	unsigned int		rsize;		/* Maximum read size (0 for none) */
>  	atomic_t		nr_outstanding;	/* Number of ops in progress */
>  	atomic_t		nr_copy_ops;	/* Number of copy-to-cache ops in progress */
>  	size_t			submitted;	/* Amount submitted for I/O so far */
> 

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE057CAE45
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Oct 2023 17:54:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697471686;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/X7V6T8zVlo2fHBxcisJuA1E+pNlhzGpYZSX+iHfxUA=;
	b=XcEs8c1KmHaPg1AGVw6F4ljGdc/pXChXLVHMwcoMOUW2PULJmDl4ZAEjh6FuUVHv3JjcWE
	cYpFP7R1T4jd/EMryRymqPhpYO7cyffOKxWKZTPaUwVUVuH09IWO4rxKjSPhYVnGgQ6jFg
	Rp+ehmeL0Plx/Q+E/lNIZDt3IvLDsnE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-txln3TJRPn6qMC1rCZEqpA-1; Mon, 16 Oct 2023 11:54:44 -0400
X-MC-Unique: txln3TJRPn6qMC1rCZEqpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C0FA10138B4;
	Mon, 16 Oct 2023 15:54:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 19919C15BBC;
	Mon, 16 Oct 2023 15:54:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CFD55194658C;
	Mon, 16 Oct 2023 15:54:41 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5BD671946587 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 16 Oct 2023 15:54:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0C9E9492BEF; Mon, 16 Oct 2023 15:54:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05F15492BEE
 for <linux-cachefs@redhat.com>; Mon, 16 Oct 2023 15:54:40 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3AE4862F29
 for <linux-cachefs@redhat.com>; Mon, 16 Oct 2023 15:54:40 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125-1pgibEZzNuWogCpPuyGcpA-1; Mon,
 16 Oct 2023 11:54:33 -0400
X-MC-Unique: 1pgibEZzNuWogCpPuyGcpA-1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 537DFCE1804;
 Mon, 16 Oct 2023 15:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D9AC433C9;
 Mon, 16 Oct 2023 15:44:55 +0000 (UTC)
Message-ID: <a07c64e179e30c0962094eea5d1282977c4a4d90.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, Steve French <smfrench@gmail.com>
Date: Mon, 16 Oct 2023 11:44:54 -0400
In-Reply-To: <20231013155727.2217781-4-dhowells@redhat.com>
References: <20231013155727.2217781-1-dhowells@redhat.com>
 <20231013155727.2217781-4-dhowells@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Subject: Re: [Linux-cachefs] [RFC PATCH 03/53] netfs: Note nonblockingness
 in the netfs_io_request struct
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
 Shyam Prasad N <sprasad@microsoft.com>, linux-kernel@vger.kernel.org,
 v9fs@lists.linux.dev, netdev@vger.kernel.org,
 Dominique Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Tom Talpey <tom@talpey.com>,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com, linux-mm@kvack.org,
 Marc Dionne <marc.dionne@auristor.com>, Ilya Dryomov <idryomov@gmail.com>,
 linux-afs@lists.infradead.org, Christian Brauner <christian@brauner.io>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2023-10-13 at 16:56 +0100, David Howells wrote:
> Allow O_NONBLOCK to be noted in the netfs_io_request struct.  Also add a
> flag, NETFS_RREQ_BLOCKED to record if we did block.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: linux-cachefs@redhat.com
> cc: linux-fsdevel@vger.kernel.org
> cc: linux-mm@kvack.org
> ---
>  fs/netfs/objects.c    | 2 ++
>  include/linux/netfs.h | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
> index 85f428fc52e6..e41f9fc9bdd2 100644
> --- a/fs/netfs/objects.c
> +++ b/fs/netfs/objects.c
> @@ -37,6 +37,8 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
>  	INIT_LIST_HEAD(&rreq->subrequests);
>  	refcount_set(&rreq->ref, 1);
>  	__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
> +	if (file && file->f_flags & O_NONBLOCK)
> +		__set_bit(NETFS_RREQ_NONBLOCK, &rreq->flags);
>  	if (rreq->netfs_ops->init_request) {
>  		ret = rreq->netfs_ops->init_request(rreq, file);
>  		if (ret < 0) {
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index 282511090ead..b92e982ac4a0 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -205,6 +205,8 @@ struct netfs_io_request {
>  #define NETFS_RREQ_DONT_UNLOCK_FOLIOS	3	/* Don't unlock the folios on completion */
>  #define NETFS_RREQ_FAILED		4	/* The request failed */
>  #define NETFS_RREQ_IN_PROGRESS		5	/* Unlocked when the request completes */
> +#define NETFS_RREQ_NONBLOCK		6	/* Don't block if possible (O_NONBLOCK) */
> +#define NETFS_RREQ_BLOCKED		7	/* We blocked */
>  	const struct netfs_request_ops *netfs_ops;
>  };
>  
> 

I'd prefer to see this patch squashed in with the first patches that
actually check for these flags. I can't look at this patch alone and
tell how it'll be used.

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


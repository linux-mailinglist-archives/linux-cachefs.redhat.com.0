Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E65E149820D
	for <lists+linux-cachefs@lfdr.de>; Mon, 24 Jan 2022 15:25:17 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-UdrEonlDNASSlBDQc0WLig-1; Mon, 24 Jan 2022 09:25:13 -0500
X-MC-Unique: UdrEonlDNASSlBDQc0WLig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5851A100CCC0;
	Mon, 24 Jan 2022 14:25:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EA977E419;
	Mon, 24 Jan 2022 14:25:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 939064BB7B;
	Mon, 24 Jan 2022 14:25:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OEK7f3014955 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 09:20:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 937A42156713; Mon, 24 Jan 2022 14:20:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F3E9217B401
	for <linux-cachefs@redhat.com>; Mon, 24 Jan 2022 14:20:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C43B38030C7
	for <linux-cachefs@redhat.com>; Mon, 24 Jan 2022 14:20:04 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-53-fIhQS6B9NJWAmpQoQ4nj3Q-1; Mon, 24 Jan 2022 09:20:00 -0500
X-MC-Unique: fIhQS6B9NJWAmpQoQ4nj3Q-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1nC0CL-000kY5-Fu; Mon, 24 Jan 2022 14:19:57 +0000
Date: Mon, 24 Jan 2022 14:19:57 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <Ye61jfhL7K9Ethxz@casper.infradead.org>
References: <164303051132.2163193.10493291874899600548.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <164303051132.2163193.10493291874899600548.stgit@warthog.procyon.org.uk>
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
Cc: nspmangalore@gmail.com, smfrench@gmail.com, linux-cachefs@redhat.com,
	Jeff Layton <jlayton@kernel.org>, linux-cifs@vger.kernel.org
Subject: Re: [Linux-cachefs] [RFC PATCH] cifs: Transition from ->readpages()
	to ->readahead()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 24, 2022 at 01:21:51PM +0000, David Howells wrote:
> Transition the cifs filesystem from using the old ->readpages() method to
> using the new ->readahead() method.
> 
> For the moment, this removes any invocation of fscache to read data from
> the local cache, leaving that to another patch.
> 
> Questions for Willy:
>  - Can we get a function to return the number of pages in a readahead
>    batch?
> 
>  - Can we get a function to commit a readahead batch?  Currently, this is
>    done when we call __readahead_batch(), but that means ractl->_nr_pages
>    isn't up to date at the point we need it to be.  However, we want to
>    check to see if the ractl is empty, then get server credits and only
>    *then* call __readahead_batch() as we don't know how big a batch we're
>    allowed till we have the credits.

If you insist on using the primitives in a way that nobody else uses
them, you're going to find they don't work.  What's wrong with the
way that FUSE uses them in fuse_readahead()?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F268E49839B
	for <lists+linux-cachefs@lfdr.de>; Mon, 24 Jan 2022 16:33:31 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-MXWvCkPbMa-KAxo2n-lbbA-1; Mon, 24 Jan 2022 10:33:27 -0500
X-MC-Unique: MXWvCkPbMa-KAxo2n-lbbA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CF371091DA1;
	Mon, 24 Jan 2022 15:33:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C70274EB1;
	Mon, 24 Jan 2022 15:33:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5FD784BB7C;
	Mon, 24 Jan 2022 15:33:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OFXH8L020044 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 10:33:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 56F5C492CB1; Mon, 24 Jan 2022 15:33:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53BB5492CAE
	for <linux-cachefs@redhat.com>; Mon, 24 Jan 2022 15:33:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A7EC38011C0
	for <linux-cachefs@redhat.com>; Mon, 24 Jan 2022 15:33:17 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-554-Z7X_tWabM9Ozv7HJiZsLGQ-1; Mon, 24 Jan 2022 10:33:15 -0500
X-MC-Unique: Z7X_tWabM9Ozv7HJiZsLGQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1nC1LA-000pgD-TO; Mon, 24 Jan 2022 15:33:08 +0000
Date: Mon, 24 Jan 2022 15:33:08 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <Ye7GtNRgxkT9S6sG@casper.infradead.org>
References: <Ye61jfhL7K9Ethxz@casper.infradead.org>
	<164303051132.2163193.10493291874899600548.stgit@warthog.procyon.org.uk>
	<2255918.1643037281@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <2255918.1643037281@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 24, 2022 at 03:14:41PM +0000, David Howells wrote:
> Matthew Wilcox <willy@infradead.org> wrote:
> 
> > > Questions for Willy:
> > >  - Can we get a function to return the number of pages in a readahead
> > >    batch?
> > > 
> > >  - Can we get a function to commit a readahead batch?  Currently, this is
> > >    done when we call __readahead_batch(), but that means ractl->_nr_pages
> > >    isn't up to date at the point we need it to be.  However, we want to
> > >    check to see if the ractl is empty, then get server credits and only
> > >    *then* call __readahead_batch() as we don't know how big a batch we're
> > >    allowed till we have the credits.
> > 
> > If you insist on using the primitives in a way that nobody else uses
> > them, you're going to find they don't work.  What's wrong with the
> > way that FUSE uses them in fuse_readahead()?
> 
> You mean doing this?
> 
> 		nr_pages = readahead_count(rac) - nr_pages;
> 
> that would seem to indicate that the readahead interface is wrong.  Why should
> readahead_count() need correction?  I think I can see *why* the batching stuff
> is hidden, but it seems that the comment for readahead_count() needs to
> mention this if you aren't going to fix it.
> 
> Would it be possible to make readahead_count() do:
> 
> 	return rac->_nr_pages - rac->_batch_count;
> 
> maybe?

Yes, I think that would make sense.  Do we also need to change
readhead_length()?  It seems to me that it's only ever called once at
initialisation, so it should be possible to keep the two in sync.
Can you write & test such a patch?  I'll support it going upstream
(either by taking it myself or giving you a R-b to take it through your
tree).

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


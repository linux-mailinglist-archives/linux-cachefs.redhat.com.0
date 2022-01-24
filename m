Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6584983EC
	for <lists+linux-cachefs@lfdr.de>; Mon, 24 Jan 2022 16:58:56 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-bJ9CE4_aO_enCJSDf3mnRw-1; Mon, 24 Jan 2022 10:58:54 -0500
X-MC-Unique: bJ9CE4_aO_enCJSDf3mnRw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9545D6408E;
	Mon, 24 Jan 2022 15:58:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F62974EA3;
	Mon, 24 Jan 2022 15:58:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C1AD4BB7C;
	Mon, 24 Jan 2022 15:58:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OFwmlp021558 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 10:58:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2B05A401E49; Mon, 24 Jan 2022 15:58:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27635401E45
	for <linux-cachefs@redhat.com>; Mon, 24 Jan 2022 15:58:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E72C3C00129
	for <linux-cachefs@redhat.com>; Mon, 24 Jan 2022 15:58:48 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-296-pnoopqQcOAGgrozxcOFgEg-1; Mon, 24 Jan 2022 10:58:46 -0500
X-MC-Unique: pnoopqQcOAGgrozxcOFgEg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1nC1jv-000rou-RY; Mon, 24 Jan 2022 15:58:43 +0000
Date: Mon, 24 Jan 2022 15:58:43 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <Ye7Ms67MA0kycc/x@casper.infradead.org>
References: <Ye7GtNRgxkT9S6sG@casper.infradead.org>
	<Ye61jfhL7K9Ethxz@casper.infradead.org>
	<164303051132.2163193.10493291874899600548.stgit@warthog.procyon.org.uk>
	<2255918.1643037281@warthog.procyon.org.uk>
	<2270964.1643039187@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <2270964.1643039187@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On Mon, Jan 24, 2022 at 03:46:27PM +0000, David Howells wrote:
> Matthew Wilcox <willy@infradead.org> wrote:
> 
> > > Would it be possible to make readahead_count() do:
> > > 
> > > 	return rac->_nr_pages - rac->_batch_count;
> > > 
> > > maybe?
> > 
> > Yes, I think that would make sense.  Do we also need to change
> > readhead_length()?  It seems to me that it's only ever called once at
> > initialisation, so it should be possible to keep the two in sync.
> > Can you write & test such a patch?  I'll support it going upstream
> > (either by taking it myself or giving you a R-b to take it through your
> > tree).
> 
> It seems I also have a problem with readahead_index() needing compensation
> too.  I'm guessing that's more of a problem, however, as I think that's
> expected to refer to the beginning of the current batch.

Well, that's the problem isn't it?  You're expecting to mutate the state
and then refer to its previous state instead of its current state,
whereas the other users refer to the current state instead of the
previous state.  Can't you pull readahead_index() out of the ractl
ahead of the mutation?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


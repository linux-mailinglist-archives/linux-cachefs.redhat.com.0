Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A14B031CA19
	for <lists+linux-cachefs@lfdr.de>; Tue, 16 Feb 2021 12:48:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613476126;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vCv1wj5rLK+1dGX7ldGEUrmJNHnTXxsMd8E01qQ2nu0=;
	b=CUebQng6q8LAPdJsXQ8blgnaHHQybldXwRlsAydj5YSYv8PsncBI2fDCZp95XSDdP4CkVS
	ZlfMmODmRdHwcMbRVmcQCIw2EFLLFV2jDQ/q1XNYGXeOI447GWNKUfM8vvDV+kj+PQZepF
	DtllKOqU3r+7G4jllDjp6qPVJWcHTR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-3e4a-HnqOXmgUULgUKZXQA-1; Tue, 16 Feb 2021 06:48:44 -0500
X-MC-Unique: 3e4a-HnqOXmgUULgUKZXQA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 941DF1005501;
	Tue, 16 Feb 2021 11:48:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B41A60C15;
	Tue, 16 Feb 2021 11:48:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4595E18095CB;
	Tue, 16 Feb 2021 11:48:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11GBmW6i028672 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 06:48:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B20BF5C661; Tue, 16 Feb 2021 11:48:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com
	[10.10.119.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EDB605C1B4;
	Tue, 16 Feb 2021 11:48:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210216103215.GB27714@lst.de>
References: <20210216103215.GB27714@lst.de>
	<161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<161340389201.1303470.14353807284546854878.stgit@warthog.procyon.org.uk>
To: Christoph Hellwig <hch@lst.de>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
MIME-Version: 1.0
Date: Tue, 16 Feb 2021 11:48:24 +0000
Message-ID: <1429175.1613476104@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 03/33] mm: Implement readahead_control
	pageset expansion
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1429174.1613476104.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Christoph Hellwig <hch@lst.de> wrote:

> On Mon, Feb 15, 2021 at 03:44:52PM +0000, David Howells wrote:
> > Provide a function, readahead_expand(), that expands the set of pages
> > specified by a readahead_control object to encompass a revised area with a
> > proposed size and length.
> ...
> So looking at linux-next this seems to have a user, but that user is
> dead wood given that nothing implements ->expand_readahead.

Interesting question.  Code on my fscache-iter branch does implement this, but
I was asked to split the patchset up, so that's not in this subset.

> Looking at the code structure I think netfs_readahead and
> netfs_rreq_expand is a complete mess and needs to be turned upside
> down, that is instead of calling back from netfs_readahead to the
> calling file system, split it into a few helpers called by the
> caller.
> 
> But even after this can't we just expose the cache granule boundary
> to the VM so that the read-ahead request gets setup correctly from
> the very beginning?

You need to argue this one with Willy.  In my opinion, the VM should ask the
filesystem and the expansion be done before ->readahead() is called.  Willy
disagrees, however.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


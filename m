Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 16EA531ED88
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Feb 2021 18:47:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613670439;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pt0qj7NTRJYS1IrOHbOeTAb8ojKncJ+Kk5xl323GlF8=;
	b=NRgYRxpc8982i2pnnGeEnaT8fwzCNVffUgj4b+NVOuize4Xz+Sc9mZ+Hic50PBcGzR/GfT
	osu1GSVABh0Rr18oXFHWncy6SqpLF1IUi/kmLKGF5J5pvK58pGVN26+P8FnV37naZB10g1
	yB2EM8+YRNREXVht55alOKibSzZQYs4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-7N_rCzfnMr6HUj7vTez5bg-1; Thu, 18 Feb 2021 12:47:16 -0500
X-MC-Unique: 7N_rCzfnMr6HUj7vTez5bg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AA65107ACE3;
	Thu, 18 Feb 2021 17:47:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 064BF5D722;
	Thu, 18 Feb 2021 17:47:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62BD44EEF6;
	Thu, 18 Feb 2021 17:47:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11IHl74N019816 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 18 Feb 2021 12:47:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C464B6A03D; Thu, 18 Feb 2021 17:47:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com
	[10.10.119.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C64060877;
	Thu, 18 Feb 2021 17:47:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210217161358.GM2858050@casper.infradead.org>
References: <20210217161358.GM2858050@casper.infradead.org>
	<161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<161340389201.1303470.14353807284546854878.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Thu, 18 Feb 2021 17:47:00 +0000
Message-ID: <2083368.1613670420@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
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
Content-ID: <2083367.1613670420.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> So readahead_expand() needs to adjust the file's f_ra so that when the
> application gets to 64kB, it kicks off the readahead of 4MB-8MB chunk (and
> then when we get to 4MB+256kB, it kicks off the readahead of 8MB-12MB,
> and so on).

Ummm...  Two questions:

Firstly, how do I do that?  Set ->async_size?  And to what?  The expansion
could be 2MB from a ceph stripe, 256k from the cache.  Just to add to the fun,
the leading edge of the window might also be rounded downwards and the RA
trigger could be before where the app is going to start reading.

Secondly, what happens if, say, a 4MB read is covered by a single 4MB THP?

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


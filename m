Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F37B033EF01
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Mar 2021 12:00:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615978852;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oc/WQtq4tSstbU5iR59BFvmgkBtkJnfIYxM6WMwHObY=;
	b=eoNs3yjQWsKOeL4x54Hy8xBusVjICOXbocY4ug+zk/90T/LF2XpDn0aIg6fmlTIuZNmF6k
	8LubwxpEwoNh7h5hn7M+Q+wO/pNgcrFBSIZ5c9cABBXSP/MtTTtsQwDXXoGaMcQakvriGq
	57dDiGAZ4FzFHkx0WhNpSbMxfzWLIAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-cYSTYL5TM2WRcmINXn5aOg-1; Wed, 17 Mar 2021 07:00:48 -0400
X-MC-Unique: cYSTYL5TM2WRcmINXn5aOg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 280A856FDB;
	Wed, 17 Mar 2021 11:00:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A89B16E50A;
	Wed, 17 Mar 2021 11:00:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED0834BB7C;
	Wed, 17 Mar 2021 11:00:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12GKc803001328 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Mar 2021 16:38:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D6BF5B4A8; Tue, 16 Mar 2021 20:38:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-152.rdu2.redhat.com
	[10.10.118.152])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 807582BFE7;
	Tue, 16 Mar 2021 20:38:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210316190707.GD3420@casper.infradead.org>
References: <20210316190707.GD3420@casper.infradead.org>
	<161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
	<161539528910.286939.1252328699383291173.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Tue, 16 Mar 2021 20:38:00 +0000
Message-ID: <3313319.1615927080@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Wed, 17 Mar 2021 07:00:38 -0400
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 02/28] mm: Add an unlock function for
	PG_private_2/PG_fscache
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3313318.1615927080.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> So ... a page with both flags cleared should have a refcount of N.
> A page with one or both flags set should have a refcount of N+1.
> ...
> How is a poor filesystem supposed to make that true?  Also btrfs has this
> problem since it uses private_2 for its own purposes.

It's simpler if it's N+2 for both patches set.  Btw, patch 13 adds that - and
possibly that should be merged into an earlier patch.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


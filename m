Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 214A743499B
	for <lists+linux-cachefs@lfdr.de>; Wed, 20 Oct 2021 13:01:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634727688;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GA/DApvB7aWfTB6VcixjOXN+0i56oyxdbapB2kV5ouI=;
	b=ajvryyPc1JRJNkmu+r2MZbnPSC32Kj+cYPa68ke38rUUx/TSopbdkvGMC/MxHxBZIE4mB+
	vaaa197baMHZpslHkAybT2te9Ny1bwkhYI9+oAHy93j6fDVcTkyo3aEVk8QI9R5hmCn3By
	WMDRd33ZNlqR7hwsLefxi31ixmbqics=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-m7Ohdhq_OsuuCjc6bqPC7g-1; Wed, 20 Oct 2021 07:01:26 -0400
X-MC-Unique: m7Ohdhq_OsuuCjc6bqPC7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 428BD5074B;
	Wed, 20 Oct 2021 11:01:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 447B45C3E0;
	Wed, 20 Oct 2021 11:01:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF3784E58F;
	Wed, 20 Oct 2021 11:01:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KAvp6f012385 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 06:57:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 07D035BAF0; Wed, 20 Oct 2021 10:57:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9758360D30;
	Wed, 20 Oct 2021 10:57:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <67f55d920f40bf6c49643af08fe8a5cfc97a9542.camel@kernel.org>
References: <67f55d920f40bf6c49643af08fe8a5cfc97a9542.camel@kernel.org>
	<163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
	<163456871794.2614702.15398637170877934146.stgit@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Wed, 20 Oct 2021 11:57:43 +0100
Message-ID: <3164229.1634727463@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 06/67] nfs, cifs, ceph,
	9p: Disable use of fscache prior to its rewrite
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3164228.1634727463.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> The typical way to do this would be to rebrand the existing FSCACHE
> Kconfig symbols into FSCACHE_OLD and then build the new fscache
> structure such that it exists in parallel with the old.

That, there, is nub of the problem.

You can't have parallel cachefiles drivers: There's a single userspace
interface (/dev/cachefiles) and only one driver can register it.  You would
need to decide at compile time whether you want the converted or the
unconverted network filesystems to be cached.

> You'd then just drop the old infrastructure once all of the fs's are
> converted to the new. You could even make them conflict with one another in
> Kconfig too, so that only one could be built in during the transition period
> if supporting both at runtime is too difficult.
> 
> This approach of disabling everything is much more of an all-or-nothing
> affair. It may mean less "churn" overall, but it seems less "nice"
> because you have an interval of commits where fscache is non-functional.
> 
> I'm not necessarily opposed to this approach, but I'd like to better
> understand why doing it this way was preferred.

I'm trying to avoid adding two parallel drivers, but change in place so that I
can test parts of it as I go along.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


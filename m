Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 240DD223F5B
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Jul 2020 17:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594999178;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0RiPDTo1eX6kNGjblfGI1zou7PC0q3U209PwtlfbCgQ=;
	b=amAEaWRQmboDV0zH8KivJs1TQHxIGoAopRu54AVsDaAkFSU2xX1mezVy7CsE6mMh3ecuAh
	PvxqBGt/wXpr0ZYOSf2bKaw9M9NAl00zbrc8AuX5U7+Jg7dR3fhxMxkc8iLp2gg2ZziPbn
	u074LsIbk70Wo0Q7cULEhTwcLgFzNL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-zhdzJ5_uNUOBSvdHNLngmw-1; Fri, 17 Jul 2020 11:19:37 -0400
X-MC-Unique: zhdzJ5_uNUOBSvdHNLngmw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73F7D2DA1;
	Fri, 17 Jul 2020 15:19:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0266619B5;
	Fri, 17 Jul 2020 15:19:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D0AD1809561;
	Fri, 17 Jul 2020 15:19:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06HFJV6w009452 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 17 Jul 2020 11:19:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 576A26FED1; Fri, 17 Jul 2020 15:19:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-113.rdu2.redhat.com
	[10.10.112.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 91C9872E48;
	Fri, 17 Jul 2020 15:19:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200717142541.GA21567@fieldses.org>
References: <20200717142541.GA21567@fieldses.org>
	<1594825849-24991-1-git-send-email-dwysocha@redhat.com>
To: bfields@fieldses.org (J. Bruce Fields)
MIME-Version: 1.0
Content-ID: <3607830.1594999165.1@warthog.procyon.org.uk>
Date: Fri, 17 Jul 2020 16:19:25 +0100
Message-ID: <3607831.1594999165@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06HFJV6w009452
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com,
	Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [RFC PATCH v1 0/13] Convert NFS client to new
	fscache-iter API
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

J. Bruce Fields <bfields@fieldses.org> wrote:

> Say I had a hypothetical, err, friend, who hadn't been following that
> FS-Cache work--could you summarize the advantages it bring us?

https://lore.kernel.org/linux-nfs/159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk/T/#t

 - Makes the caching code a lot simpler (~2400 LoC removed, ~1000 LoDoc[*]
   removed at the moment from fscache, cachefiles and afs).

 - Stops using bmap to work out what data is cached.  This isn't reliable with
   modern extend-based filesystems.  A bitmap of cached granules is saved in
   an xattr instead.

 - Uses async DIO (kiocbs) to do I/O to/from the cache rather than using
   buffered writes (kernel_write) and pagecache snooping for read (don't ask).

   - A lot faster and less CPU intensive as there's no page-to-page copying.

   - A lot less VM pressure as it doesn't have duplicate pages in the backing
     fs that aren't really accounted right.

 - Uses tmpfiles+link to better handle invalidation.  It will at some point
   hopefully employ linkat(AT_LINK_REPLACE) to effect cut-over on disk rather
   than unlink,link.

David

[*] The upstream docs got ReSTified, so the doc patches I have are now useless
    and need reworking:-(.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


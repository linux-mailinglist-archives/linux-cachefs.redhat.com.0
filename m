Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C8310FC801
	for <lists+linux-cachefs@lfdr.de>; Thu, 14 Nov 2019 14:41:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573738859;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AIewtAydnlPvaBQcZ+4N/k42ID679gczeJG0zzPlTgs=;
	b=b9baOUrI3Knb69ZMgpdGQGe0ITc9WJwH9B9S1/XTTYuCU2c7yD/K28hhno6TOUQb0mgJcl
	H7NpyGxa3ARBzdsQ/yJSwbfsaOSmKTT/Yha/IeXvtAfpWz3nq5PSiSW3hGmCjvVCet+ju7
	fb3a8zeal34PS3PoekXqfxPX3yvSLoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-mAJ3o_SkPzuwu3OgygnDFw-1; Thu, 14 Nov 2019 08:40:57 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2F808048E7;
	Thu, 14 Nov 2019 13:40:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 010525E254;
	Thu, 14 Nov 2019 13:40:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 344264BB5B;
	Thu, 14 Nov 2019 13:40:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEDeiDa017873 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 08:40:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B88DE6135B; Thu, 14 Nov 2019 13:40:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-120-254.rdu2.redhat.com
	[10.10.120.254])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3751A60BD7;
	Thu, 14 Nov 2019 13:40:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <24942.1573667720@warthog.procyon.org.uk>
References: <24942.1573667720@warthog.procyon.org.uk>
To: Christoph Hellwig <hch@lst.de>, Dave Chinner <dchinner@redhat.com>,
	"Theodore Ts'o" <tytso@mit.edu>
MIME-Version: 1.0
Content-ID: <30126.1573738838.1@warthog.procyon.org.uk>
Date: Thu, 14 Nov 2019 13:40:38 +0000
Message-ID: <30127.1573738838@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] How to avoid using bmap in cachefiles --
	FS-Cache/CacheFiles rewrite
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: mAJ3o_SkPzuwu3OgygnDFw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

I've been rewriting cachefiles in the kernel and it now uses kiocbs to do
async direct I/O to/from the cache files - which seems to make a 40-48% spe=
ed
improvement.

However, I've replaced the use of bmap internally to detect whether data is
present or not - which is dodgy for a number of reasons, not least that
extent-based filesystems might insert or remove blocks of zeros to shape th=
e
extents better, thereby rendering the metadata information useless for
cachefiles.

But using a separate map has a couple of problems:

 (1) The map is metadata kept outside of the filesystem journal, so coheren=
cy
     management is necessary

 (2) The map gets hard to manage for very large files (I'm using 256KiB
     granules, so 1 bit per granule means a 512-byte map block can span 1Gi=
B)
     and xattrs can be of limited capacity.

I seem to remember you said something along the lines of it being possible =
to
tell the filesystem not to do discarding and insertion of blocks of zeros. =
 Is
there a generic way to do that?

Also, is it possible to make it so that I can tell an O_DIRECT read to fail
partially or, better, completely if there's no data to be had in part of th=
e
range?  I can see DIO_SKIP_HOLES, but that only seems to affect writes

Thanks,
David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


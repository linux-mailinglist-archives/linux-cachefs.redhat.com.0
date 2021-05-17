Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8940138343D
	for <lists+linux-cachefs@lfdr.de>; Mon, 17 May 2021 17:07:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621264039;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fnSd5lkgKX5BxixQkMQRocFRxyRB4G1iRh49nWyQhbk=;
	b=edgY+Oajk54DymQ7bs9jANyLHC2OelBVLSX0/h+MonROTz1sBgK448qZdSMK7yTS5Z5QSZ
	lESqP4vbDqGv+PP42EufbZI7KDHkuRfSedzQwzr4MvXzKfrcJdzKUK9T1N4tRiUZKok2Jx
	4uwEujliwBwzs8UpusUQ+jA1uoD3cH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-zhC4s0gVPMOggup_nTSYzQ-1; Mon, 17 May 2021 11:07:18 -0400
X-MC-Unique: zhC4s0gVPMOggup_nTSYzQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 964541020C36;
	Mon, 17 May 2021 15:07:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B681E60C25;
	Mon, 17 May 2021 15:07:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5A2E55347;
	Mon, 17 May 2021 15:07:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14HF75BO028406 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 17 May 2021 11:07:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3E6DE5D72F; Mon, 17 May 2021 15:07:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-217.rdu2.redhat.com
	[10.10.112.217])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E90135D6D7;
	Mon, 17 May 2021 15:06:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: "Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
	"Darrick J. Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>
MIME-Version: 1.0
Date: Mon, 17 May 2021 16:06:58 +0100
Message-ID: <206078.1621264018@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-btrfs@vger.kernel.org
Subject: [Linux-cachefs] How capacious and well-indexed are ext4,
	xfs and btrfs directories?
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
Content-ID: <206077.1621264018.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

With filesystems like ext4, xfs and btrfs, what are the limits on directory
capacity, and how well are they indexed?

The reason I ask is that inside of cachefiles, I insert fanout directories
inside index directories to divide up the space for ext2 to cope with the
limits on directory sizes and that it did linear searches (IIRC).

For some applications, I need to be able to cache over 1M entries (render
farm) and even a kernel tree has over 100k.

What I'd like to do is remove the fanout directories, so that for each logical
"volume"[*] I have a single directory with all the files in it.  But that
means sticking massive amounts of entries into a single directory and hoping
it (a) isn't too slow and (b) doesn't hit the capacity limit.

David

[*] What that means is netfs-dependent.  For AFS it would be a single volume
within a cell; for NFS, it would be a particular FSID on a server, for
example.  Kind of corresponds to a thing that gets its own superblock on the
client.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


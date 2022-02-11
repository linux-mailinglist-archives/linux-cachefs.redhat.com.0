Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4766C390D27
	for <lists+linux-cachefs@lfdr.de>; Wed, 26 May 2021 02:01:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621987266;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ve6bdkahih/4Q0+tQllM6jNYczTPvIwVEzW6LgtmWy4=;
	b=OpWR+mweQOVTUiY6w1iCVNbULC8N7Fkjj/bEcofzT7yTKN87R8nZ/hIvgsZsdDKYb4RerL
	R8RfvnUv4YVpLJH8bqZM5ODwASwdbrQA+Ebd00Vd1Z4wWSqoW9UqvYykmhTyR/dhHHt64H
	45hsRcnQFrk3rEw22s3B++qh7sJfYn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-4-8llV4QPqqmhzDQkp099Q-1; Tue, 25 May 2021 20:01:03 -0400
X-MC-Unique: 4-8llV4QPqqmhzDQkp099Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D7998049FF;
	Wed, 26 May 2021 00:01:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C529A234;
	Wed, 26 May 2021 00:00:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79AC855342;
	Wed, 26 May 2021 00:00:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14Q00s5E014656 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 25 May 2021 20:00:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0A9FB5D75A; Wed, 26 May 2021 00:00:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-24.rdu2.redhat.com
	[10.10.112.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B39F25D6AC;
	Wed, 26 May 2021 00:00:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <00224B62-4903-4D33-A835-2DC8CC0E3B4D@dilger.ca>
References: <00224B62-4903-4D33-A835-2DC8CC0E3B4D@dilger.ca>
	<6E4DE257-4220-4B5B-B3D0-B67C7BC69BB5@dilger.ca>
	<206078.1621264018@warthog.procyon.org.uk>
	<4169583.1621981910@warthog.procyon.org.uk>
To: Andreas Dilger <adilger@dilger.ca>
MIME-Version: 1.0
Date: Wed, 26 May 2021 01:00:27 +0100
Message-ID: <4176733.1621987227@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: xfs <linux-xfs@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J. Wong" <djwong@kernel.org>,
	NeilBrown <neilb@suse.com>, Chris Mason <clm@fb.com>,
	linux-cachefs@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>
Subject: Re: [Linux-cachefs] How capacious and well-indexed are ext4,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <4176732.1621987227.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Andreas Dilger <adilger@dilger.ca> wrote:

> > Any thoughts on how that might scale?  vfs_tmpfile() doesn't appear to
> > require the directory inode lock.  I presume the directory is required for
> > security purposes in addition to being a way to specify the target
> > filesystem.
> 
> I don't see how that would help much?

When it comes to dealing with a file I don't have cached, I can't probe the
cache file to find out whether it has data that I can read until I've opened
it (or found out it doesn't exist).  When it comes to writing to a new cache
file, I can't start writing until the file is created and opened - but this
will potentially hold up close, data sync and writes that conflict (and have
to implicitly sync).  If I can use vfs_tmpfile() to defer synchronous
directory accesses, that could be useful.

As mentioned, creating a link to a temporary cache file (ie. modifying the
directory) could be deferred to a background thread whilst allowing file I/O
to progress to the tmpfile.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


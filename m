Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E437D5072C5
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Apr 2022 18:17:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650385029;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Sd6GfOU9RBQBf02zOIqJbbsPzMCcG84SZRbyBXAcp4g=;
	b=gJGIwhW86eL2w7Jzpf7YgT/+DSozRt24OuKsJ3VdAyBPOJ5uhog2bN1ZOmtvFrlE2vmlLZ
	TjcKNS/1DZtUtuAXRo/3MOt7sJJX5QuG6xm1SUfbPdHvXq+dzD/8swWv1PSIyYQ+Oow7H8
	l6jlZYn8G5qUZBJybhz+uEjAXRHLMnI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-FqgaBnr6NtCdlYsbn25sTA-1; Tue, 19 Apr 2022 12:17:06 -0400
X-MC-Unique: FqgaBnr6NtCdlYsbn25sTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D138496B082;
	Tue, 19 Apr 2022 16:17:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C58FD112131E;
	Tue, 19 Apr 2022 16:17:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 67D5B1940340;
	Tue, 19 Apr 2022 16:17:05 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5D40D1947BBF for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 19 Apr 2022 16:17:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 38B0B406794; Tue, 19 Apr 2022 16:17:04 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 718A4403374;
 Tue, 19 Apr 2022 16:17:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <Yl7EyMLnqqDv63yW@rabbit.intern.cm-ag>
References: <Yl7EyMLnqqDv63yW@rabbit.intern.cm-ag>
 <YlWWbpW5Foynjllo@rabbit.intern.cm-ag>
 <454834.1650373340@warthog.procyon.org.uk>
To: Max Kellermann <mk@cm4all.com>
MIME-Version: 1.0
Date: Tue, 19 Apr 2022 17:17:02 +0100
Message-ID: <508603.1650385022@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] fscache corruption in Linux 5.17?
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <508602.1650385022.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Max Kellermann <mk@cm4all.com> wrote:

> At least one web server is still in this broken state right now.  So
> if you need anything from that server, tell me, and I'll get it.

Can you turn on:

echo 65536 >/sys/kernel/debug/tracing/buffer_size_kb
echo 1 >/sys/kernel/debug/tracing/events/cachefiles/cachefiles_read/enable
echo 1 >/sys/kernel/debug/tracing/events/cachefiles/cachefiles_write/enable
echo 1 >/sys/kernel/debug/tracing/events/cachefiles/cachefiles_trunc/enable
echo 1 >/sys/kernel/debug/tracing/events/cachefiles/cachefiles_io_error/enable
echo 1 >/sys/kernel/debug/tracing/events/cachefiles/cachefiles_vfs_error/enable

Then try and trigger the bug if you can.  The trace can be viewed with:

cat /sys/kernel/debug/tracing/trace | less

The problem very likely happens on write rather than read.  If you know of a
file that's corrupt, turn on the tracing above and read that file.  Then look
in the trace buffer and you should see the corresponding lines and they should
have the backing inode in them, marked "B=iiii" where "iiii" is the inode
number of the file in hex.  You should be able to examine the backing file by
finding it with something like:

	find /var/cache/fscache -inum $((0xiiii))

and see if you can see the corruption in there.  Note that there may be blocks
of zeroes corresponding to unfetched file blocks.

Also, what filesystem is backing your cachefiles cache?  It could be useful to
dump the extent list of the file.  You should be able to do this with
"filefrag -e".

As to why this happens, a write that's misaligned by 31 bytes should cause DIO
to a disk to fail - so it shouldn't be possible to write that.  However, I'm
doing fallocate and truncate on the file to shape it so that DIO will work on
it, so it's possible that there's a bug there.  The cachefiles_trunc trace
lines may help catch that.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


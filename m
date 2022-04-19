Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CF573507378
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Apr 2022 18:43:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650386579;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zwZLonzNOzflPoT111CJ+Gyf3Bp6O/h8JVeRkz5aMAI=;
	b=bzaKlHjw0ORil1lKbCiSwCWjV22tGu6Zj0M11Df4DotT9VdOnQQtTxAOt2VCR+NZ34hwHW
	CWUagbRleG+MyqYFlMGMuMwj+9bFgPZQ1UNA3fu8nRpl3+sikoWOdYniIZ+XHZfpYaZwkn
	KjpK5QslNZpTMfFXKrQ7sBUiwo7qLYo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-pDFgxJzKP8mAoxHHILz7cQ-1; Tue, 19 Apr 2022 12:42:56 -0400
X-MC-Unique: pDFgxJzKP8mAoxHHILz7cQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E4A71C068FB;
	Tue, 19 Apr 2022 16:42:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53C61C53529;
	Tue, 19 Apr 2022 16:42:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1CCFC1940340;
	Tue, 19 Apr 2022 16:42:55 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1B2541949761 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 19 Apr 2022 16:42:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 06361C53533; Tue, 19 Apr 2022 16:42:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8FB0C5353B;
 Tue, 19 Apr 2022 16:42:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <Yl7d++G25sNXIR+p@rabbit.intern.cm-ag>
References: <Yl7d++G25sNXIR+p@rabbit.intern.cm-ag>
 <YlWWbpW5Foynjllo@rabbit.intern.cm-ag>
 <507518.1650383808@warthog.procyon.org.uk>
To: Max Kellermann <mk@cm4all.com>
MIME-Version: 1.0
Date: Tue, 19 Apr 2022 17:42:49 +0100
Message-ID: <509961.1650386569@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <509960.1650386569.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Max Kellermann <mk@cm4all.com> wrote:

> Did you read this part of my email?:

Sorry, I'm trying to deal with several things at once.

> My theory was that fscache shows a mix of old and new pages after the
> file was modified.  Does this make sense?

Okay - that makes a bit more sense.

Could the file have been modified by a third party?  If you're using NFS3
there's a problem if two clients can modify a file at the same time.  The
second write can mask the first write and the client has no way to detect it.
The problem is inherent to the protocol design.  The NFS2 and NFS3 protocols
don't support anything better than {ctime,mtime,filesize} - the change
attribute only becomes available with NFS4.

If an NFS file is opened for writing locally, the cache for it supposed to be
invalidated and remain unused until there are no open file descriptors left
referring to it.  This is intended for handling DIO writes, but it should
serve for this also.

The following might be of use in checking if the invalidation happens locally:

echo 1 >/sys/kernel/debug/tracing/events/fscache/fscache_invalidate/enable

And then this can be used to check if it correctly identifies that it has an
obsolete version of the file in the cache when it binds to it:

echo 1 >/sys/kernel/debug/tracing/events/cachefiles/cachefiles_coherency/enable


David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


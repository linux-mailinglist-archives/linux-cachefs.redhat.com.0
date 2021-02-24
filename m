Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 242A1323C86
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Feb 2021 14:00:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614171652;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ABgoxZxq3UOJAEkm7kK3Ay5KnC+NOvqq2SONeYMOPFI=;
	b=LcjpaXbyiyipVW8pSiZBvy+237nLlPJ3MQO+ryfgxhDmUBk+Ft2DUCPnRge7A2SXT5/miL
	jna4lqQyJEvqKhhOAQQNcGgfHZMUK2LBLGERecUfhtm2Txkx+f8aEipj9LbNKUIlZs2j30
	nUEi71oKtl1296SiKkQ/knkfwdwx7TM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-wa6bLJTJNWeXXT0baw3GjA-1; Wed, 24 Feb 2021 08:00:50 -0500
X-MC-Unique: wa6bLJTJNWeXXT0baw3GjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EA8019357AF;
	Wed, 24 Feb 2021 13:00:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A68FB60C4D;
	Wed, 24 Feb 2021 13:00:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D0C418095CB;
	Wed, 24 Feb 2021 13:00:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11OD0djT008925 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 24 Feb 2021 08:00:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 61D535C1D0; Wed, 24 Feb 2021 13:00:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com
	[10.10.119.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 671DD5C23E;
	Wed, 24 Feb 2021 13:00:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAKneAXnd-qYteMM5iZxxNjd3rRHfxo9YNY-idXRZNStzdD7+Cw@mail.gmail.com>
References: <CAKneAXnd-qYteMM5iZxxNjd3rRHfxo9YNY-idXRZNStzdD7+Cw@mail.gmail.com>
To: Jan Krcmar <honza801@gmail.com>
MIME-Version: 1.0
Date: Wed, 24 Feb 2021 13:00:11 +0000
Message-ID: <3741116.1614171611@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11OD0djT008925
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] How to use FS-Cache with CacheFS (not
	CacheFiles)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3741115.1614171611.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jan Krcmar <honza801@gmail.com> wrote:

> according to this documentation:
> https://www.kernel.org/doc/html/latest/filesystems/caching/fscache.html
> 
> have you any hint how to setup fs-cache with raw device (aka cachefs).
> all the documents i've found describe process of setting up with
> cachefilesd. fe.
> https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/managing_file_systems/getting-started-with-fs-cache_managing-file-systems
> 
> https://en.wikipedia.org/wiki/CacheFS
> "CacheFS is a Filesystem for the FS-Cache facility. A block device can
> be used as cache by simply mounting it. Needs no special activation
> and is deactivated by unmounting it. "
> 
> are these informations correct? is it possible to setup fs-cache with
> block device?

At the moment you can't do that.  The code that allowed you to use a blockdev
directly proved to have a severe flaw in it and has since bitrotted, since it
never went upstream.

I'm looking at doing fscache v2.0 and storing all of the data in one file,
which would be storable on a blockdev, but it's in the planning stages at the
moment.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


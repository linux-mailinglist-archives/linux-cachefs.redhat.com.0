Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8EA214FA1
	for <lists+linux-cachefs@lfdr.de>; Sun,  5 Jul 2020 22:53:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-Ut6ANyBrPEW2p0Sgb6Ua1w-1; Sun, 05 Jul 2020 16:53:07 -0400
X-MC-Unique: Ut6ANyBrPEW2p0Sgb6Ua1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 701ED8064BB;
	Sun,  5 Jul 2020 20:53:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2176D872F9;
	Sun,  5 Jul 2020 20:53:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4954B6C9F4;
	Sun,  5 Jul 2020 20:52:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 065KpEHk027823 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 5 Jul 2020 16:51:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E868D2166BA0; Sun,  5 Jul 2020 20:51:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E48452166B27
	for <linux-cachefs@redhat.com>; Sun,  5 Jul 2020 20:51:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58CE8924902
	for <linux-cachefs@redhat.com>; Sun,  5 Jul 2020 20:51:08 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-26-cGtwcF19M1OGUsmSMiJhRA-1;
	Sun, 05 Jul 2020 16:51:06 -0400
X-MC-Unique: cGtwcF19M1OGUsmSMiJhRA-1
Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CB3FB2E4;
	Sun,  5 Jul 2020 20:44:50 +0000 (UTC)
Date: Sun, 5 Jul 2020 14:44:49 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20200705144449.5cf9c163@lwn.net>
In-Reply-To: <20200703214325.31036-1-rdunlap@infradead.org>
References: <20200703214325.31036-1-rdunlap@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 065KpEHk027823
X-loop: linux-cachefs@redhat.com
Cc: Eric Biggers <ebiggers@kernel.org>, "Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-doc@vger.kernel.org, autofs@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-unionfs@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
	linux-fscrypt@vger.kernel.org, linux-cachefs@redhat.com,
	Joel Becker <jlbec@evilplan.org>, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Ian Kent <raven@themaw.net>
Subject: Re: [Linux-cachefs] [PATCH 00/10] Documentation: filesystems:
 eliminate duplicated words
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri,  3 Jul 2020 14:43:15 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Fix doubled words in filesystems files.
> 
> 
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Ian Kent <raven@themaw.net>
> Cc: autofs@vger.kernel.org
> Cc: David Howells <dhowells@redhat.com>
> Cc: linux-cachefs@redhat.com
> Cc: Joel Becker <jlbec@evilplan.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: Theodore Y. Ts'o <tytso@mit.edu>
> Cc: linux-fscrypt@vger.kernel.org
> Cc: Miklos Szeredi <miklos@szeredi.hu>
> Cc: linux-unionfs@vger.kernel.org
> 
> 
>  Documentation/filesystems/autofs-mount-control.rst |    6 +++---
>  Documentation/filesystems/caching/operations.rst   |    2 +-
>  Documentation/filesystems/configfs.rst             |    2 +-
>  Documentation/filesystems/directory-locking.rst    |    4 ++--
>  Documentation/filesystems/fsverity.rst             |    2 +-
>  Documentation/filesystems/mount_api.rst            |    4 ++--
>  Documentation/filesystems/overlayfs.rst            |    2 +-
>  Documentation/filesystems/path-lookup.rst          |    2 +-
>  Documentation/filesystems/sysfs-tagging.rst        |    2 +-
>  Documentation/filesystems/vfs.rst                  |    4 ++--
>  10 files changed, 15 insertions(+), 15 deletions(-)
> 
Applied, thanks.

jon


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


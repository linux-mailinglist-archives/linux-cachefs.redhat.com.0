Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0F36F215A37
	for <lists+linux-cachefs@lfdr.de>; Mon,  6 Jul 2020 17:02:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-XFlNIgMsMe6EsQxKorvkaA-1; Mon, 06 Jul 2020 11:02:38 -0400
X-MC-Unique: XFlNIgMsMe6EsQxKorvkaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCECA800417;
	Mon,  6 Jul 2020 15:02:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDA315C241;
	Mon,  6 Jul 2020 15:02:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B70911809557;
	Mon,  6 Jul 2020 15:02:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063M5DtT000729 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 18:05:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AEBD5218ADC4; Fri,  3 Jul 2020 22:05:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA52D201FF95
	for <linux-cachefs@redhat.com>; Fri,  3 Jul 2020 22:05:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8455100CF89
	for <linux-cachefs@redhat.com>; Fri,  3 Jul 2020 22:05:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-91-mufWiVvPPjisHnb0KQsP9Q-1; Fri, 03 Jul 2020 18:05:09 -0400
X-MC-Unique: mufWiVvPPjisHnb0KQsP9Q-1
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
	by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrTT7-0006uZ-Sh; Fri, 03 Jul 2020 21:43:38 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  3 Jul 2020 14:43:16 -0700
Message-Id: <20200703214325.31036-2-rdunlap@infradead.org>
In-Reply-To: <20200703214325.31036-1-rdunlap@infradead.org>
References: <20200703214325.31036-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 06 Jul 2020 11:02:32 -0400
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
	Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
	autofs@vger.kernel.org, linux-unionfs@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Miklos Szeredi <miklos@szeredi.hu>,
	linux-fscrypt@vger.kernel.org, linux-cachefs@redhat.com,
	Joel Becker <jlbec@evilplan.org>, linux-fsdevel@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	Christoph Hellwig <hch@lst.de>, Ian Kent <raven@themaw.net>
Subject: [Linux-cachefs] [PATCH 01/10] Documentation: filesystems:
	autofs-mount-control: drop doubled words
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Drop the doubled words "the" and "and".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Ian Kent <raven@themaw.net>
Cc: autofs@vger.kernel.org
---
 Documentation/filesystems/autofs-mount-control.rst |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20200701.orig/Documentation/filesystems/autofs-mount-control.rst
+++ linux-next-20200701/Documentation/filesystems/autofs-mount-control.rst
@@ -391,7 +391,7 @@ variation uses the path and optionally i
 set to an autofs mount type. The call returns 1 if this is a mount point
 and sets out.devid field to the device number of the mount and out.magic
 field to the relevant super block magic number (described below) or 0 if
-it isn't a mountpoint. In both cases the the device number (as returned
+it isn't a mountpoint. In both cases the device number (as returned
 by new_encode_dev()) is returned in out.devid field.
 
 If supplied with a file descriptor we're looking for a specific mount,
@@ -399,12 +399,12 @@ not necessarily at the top of the mounte
 the descriptor corresponds to is considered a mountpoint if it is itself
 a mountpoint or contains a mount, such as a multi-mount without a root
 mount. In this case we return 1 if the descriptor corresponds to a mount
-point and and also returns the super magic of the covering mount if there
+point and also returns the super magic of the covering mount if there
 is one or 0 if it isn't a mountpoint.
 
 If a path is supplied (and the ioctlfd field is set to -1) then the path
 is looked up and is checked to see if it is the root of a mount. If a
 type is also given we are looking for a particular autofs mount and if
-a match isn't found a fail is returned. If the the located path is the
+a match isn't found a fail is returned. If the located path is the
 root of a mount 1 is returned along with the super magic of the mount
 or 0 otherwise.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


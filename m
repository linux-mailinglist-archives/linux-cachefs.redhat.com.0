Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BE39D215A35
	for <lists+linux-cachefs@lfdr.de>; Mon,  6 Jul 2020 17:02:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-w0ZOLf8OMv60E-UXjUuILg-1; Mon, 06 Jul 2020 11:02:37 -0400
X-MC-Unique: w0ZOLf8OMv60E-UXjUuILg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E253800432;
	Mon,  6 Jul 2020 15:02:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E5BA5D9D7;
	Mon,  6 Jul 2020 15:02:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5D1E6C9FF;
	Mon,  6 Jul 2020 15:02:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063MAedp001266 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 18:10:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 04C9A218ADC8; Fri,  3 Jul 2020 22:10:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 000B1218ADC4
	for <linux-cachefs@redhat.com>; Fri,  3 Jul 2020 22:10:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 045DB800260
	for <linux-cachefs@redhat.com>; Fri,  3 Jul 2020 22:10:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-204-G8HoLDFmOXOFOke1Fsig9w-1; Fri, 03 Jul 2020 18:10:36 -0400
X-MC-Unique: G8HoLDFmOXOFOke1Fsig9w-1
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
	by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrTTN-0006uZ-95; Fri, 03 Jul 2020 21:43:53 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  3 Jul 2020 14:43:19 -0700
Message-Id: <20200703214325.31036-5-rdunlap@infradead.org>
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
Subject: [Linux-cachefs] [PATCH 04/10] Documentation: filesystems:
	directory-locking: drop doubled word
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Drop the doubled word "the".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
---
 Documentation/filesystems/directory-locking.rst |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20200701.orig/Documentation/filesystems/directory-locking.rst
+++ linux-next-20200701/Documentation/filesystems/directory-locking.rst
@@ -28,7 +28,7 @@ RENAME_EXCHANGE in flags argument) lock
 if the target already exists, lock it.  If the source is a non-directory,
 lock it.  If we need to lock both, lock them in inode pointer order.
 Then call the method.  All locks are exclusive.
-NB: we might get away with locking the the source (and target in exchange
+NB: we might get away with locking the source (and target in exchange
 case) shared.
 
 5) link creation.  Locking rules:
@@ -56,7 +56,7 @@ rules:
 	* call the method.
 
 All ->i_rwsem are taken exclusive.  Again, we might get away with locking
-the the source (and target in exchange case) shared.
+the source (and target in exchange case) shared.
 
 The rules above obviously guarantee that all directories that are going to be
 read, modified or removed by method will be locked by caller.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


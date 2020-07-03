Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 307D7215A38
	for <lists+linux-cachefs@lfdr.de>; Mon,  6 Jul 2020 17:02:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-6ghxMr4yOu2gkPrJrmQNqw-1; Mon, 06 Jul 2020 11:02:38 -0400
X-MC-Unique: 6ghxMr4yOu2gkPrJrmQNqw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D41278064B0;
	Mon,  6 Jul 2020 15:02:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C184F60C84;
	Mon,  6 Jul 2020 15:02:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA64C72F42;
	Mon,  6 Jul 2020 15:02:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063MCRRH001541 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 18:12:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 168D5DBB0F; Fri,  3 Jul 2020 22:12:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2773DBAF7
	for <linux-cachefs@redhat.com>; Fri,  3 Jul 2020 22:12:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE585858EE2
	for <linux-cachefs@redhat.com>; Fri,  3 Jul 2020 22:12:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-385-BPdCfmfrNzS5TK5EJYWq6g-1; Fri, 03 Jul 2020 18:12:25 -0400
X-MC-Unique: BPdCfmfrNzS5TK5EJYWq6g-1
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
	by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrTTX-0006uZ-SN; Fri, 03 Jul 2020 21:44:04 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  3 Jul 2020 14:43:21 -0700
Message-Id: <20200703214325.31036-7-rdunlap@infradead.org>
In-Reply-To: <20200703214325.31036-1-rdunlap@infradead.org>
References: <20200703214325.31036-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Subject: [Linux-cachefs] [PATCH 06/10] Documentation: filesystems:
	mount_api: drop doubled word
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Drop the doubled word "struct".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
---
 Documentation/filesystems/mount_api.rst |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20200701.orig/Documentation/filesystems/mount_api.rst
+++ linux-next-20200701/Documentation/filesystems/mount_api.rst
@@ -213,7 +213,7 @@ The filesystem context points to a table
 		void (*free)(struct fs_context *fc);
 		int (*dup)(struct fs_context *fc, struct fs_context *src_fc);
 		int (*parse_param)(struct fs_context *fc,
-				   struct struct fs_parameter *param);
+				   struct fs_parameter *param);
 		int (*parse_monolithic)(struct fs_context *fc, void *data);
 		int (*get_tree)(struct fs_context *fc);
 		int (*reconfigure)(struct fs_context *fc);
@@ -247,7 +247,7 @@ manage the filesystem context.  They are
    * ::
 
 	int (*parse_param)(struct fs_context *fc,
-			   struct struct fs_parameter *param);
+			   struct fs_parameter *param);
 
      Called when a parameter is being added to the filesystem context.  param
      points to the key name and maybe a value object.  VFS-specific options

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 63DDE215A3B
	for <lists+linux-cachefs@lfdr.de>; Mon,  6 Jul 2020 17:02:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-N74t6BkzMfOcrAzi_8bIfQ-1; Mon, 06 Jul 2020 11:02:40 -0400
X-MC-Unique: N74t6BkzMfOcrAzi_8bIfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58C20BFC7;
	Mon,  6 Jul 2020 15:02:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46C7860C84;
	Mon,  6 Jul 2020 15:02:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3035E72F57;
	Mon,  6 Jul 2020 15:02:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063MCM8q001532 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 18:12:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 20A82DBF14; Fri,  3 Jul 2020 22:12:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17263DBB1E
	for <linux-cachefs@redhat.com>; Fri,  3 Jul 2020 22:12:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53A45800260
	for <linux-cachefs@redhat.com>; Fri,  3 Jul 2020 22:12:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-15--N5_d8vxNH2kFheDy7G2Ig-1; Fri, 03 Jul 2020 18:12:17 -0400
X-MC-Unique: -N5_d8vxNH2kFheDy7G2Ig-1
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
	by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrTTc-0006uZ-W1; Fri, 03 Jul 2020 21:44:10 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  3 Jul 2020 14:43:22 -0700
Message-Id: <20200703214325.31036-8-rdunlap@infradead.org>
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
Subject: [Linux-cachefs] [PATCH 07/10] Documentation: filesystems:
	overlayfs: drop doubled word
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

Drop the doubled word "the".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-unionfs@vger.kernel.org
---
 Documentation/filesystems/overlayfs.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200701.orig/Documentation/filesystems/overlayfs.rst
+++ linux-next-20200701/Documentation/filesystems/overlayfs.rst
@@ -328,7 +328,7 @@ the time of copy (on-demand vs. up-front
 Multiple lower layers
 ---------------------
 
-Multiple lower layers can now be given using the the colon (":") as a
+Multiple lower layers can now be given using the colon (":") as a
 separator character between the directory names.  For example:
 
   mount -t overlay overlay -olowerdir=/lower1:/lower2:/lower3 /merged

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


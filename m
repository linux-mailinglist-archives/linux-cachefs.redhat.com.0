Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D591221FDF3
	for <lists+linux-cachefs@lfdr.de>; Tue, 14 Jul 2020 21:59:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-U6v37B1JNkynC0FmYO8GhA-1; Tue, 14 Jul 2020 15:58:49 -0400
X-MC-Unique: U6v37B1JNkynC0FmYO8GhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 254381083E80;
	Tue, 14 Jul 2020 19:58:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9EBA60BEC;
	Tue, 14 Jul 2020 19:58:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A810A94EFE;
	Tue, 14 Jul 2020 19:58:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DBh3p2021208 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 07:43:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 939C0208DD91; Mon, 13 Jul 2020 11:43:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ED8E208DD97
	for <linux-cachefs@redhat.com>; Mon, 13 Jul 2020 11:43:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B30D833B7D
	for <linux-cachefs@redhat.com>; Mon, 13 Jul 2020 11:43:01 +0000 (UTC)
Received: from smtp.al2klimov.de (smtp.al2klimov.de [78.46.175.9]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-359-1t36yV4ENmqljm-uXKyzSw-1; Mon, 13 Jul 2020 07:42:59 -0400
X-MC-Unique: 1t36yV4ENmqljm-uXKyzSw-1
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by smtp.al2klimov.de (Postfix) with ESMTPA id 37E1ABC053;
	Mon, 13 Jul 2020 11:37:16 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: dhowells@redhat.com, corbet@lwn.net, linux-cachefs@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 13 Jul 2020 13:37:05 +0200
Message-Id: <20200713113705.33773-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam-Level: *****
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06DBh3p2021208
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 14 Jul 2020 15:58:35 -0400
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [Linux-cachefs] [PATCH] docs: filesystems: Replace HTTP links with
	HTTPS ones
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not just HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 Documentation/filesystems/caching/cachefiles.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/caching/cachefiles.rst b/Documentation/filesystems/caching/cachefiles.rst
index 65d3db476765..e58bc1fd312a 100644
--- a/Documentation/filesystems/caching/cachefiles.rst
+++ b/Documentation/filesystems/caching/cachefiles.rst
@@ -348,7 +348,7 @@ data cached therein; nor is it permitted to create new files in the cache.
 
 There are policy source files available in:
 
-	http://people.redhat.com/~dhowells/fscache/cachefilesd-0.8.tar.bz2
+	https://people.redhat.com/~dhowells/fscache/cachefilesd-0.8.tar.bz2
 
 and later versions.  In that tarball, see the files::
 
-- 
2.27.0


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


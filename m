Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D8846FBE2
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 08:38:38 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-KwUa-RwnOGutdA11lOUiyg-1; Fri, 10 Dec 2021 02:38:34 -0500
X-MC-Unique: KwUa-RwnOGutdA11lOUiyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2346E18C89C4;
	Fri, 10 Dec 2021 07:38:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8B4460C4A;
	Fri, 10 Dec 2021 07:38:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5578A180B617;
	Fri, 10 Dec 2021 07:38:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BA7aWxp027790 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 10 Dec 2021 02:36:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1DB0E401DB1; Fri, 10 Dec 2021 07:36:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A0C0401DAD
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00A00801E6E
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:32 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
	(out30-43.freemail.mail.aliyun.com [115.124.30.43]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-538-acWdEYTSOm2ddoLDiBcDtg-1; Fri, 10 Dec 2021 02:36:28 -0500
X-MC-Unique: acWdEYTSOm2ddoLDiBcDtg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V-80.ma_1639121782
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V-80.ma_1639121782) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 10 Dec 2021 15:36:22 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 10 Dec 2021 15:36:02 +0800
Message-Id: <20211210073619.21667-3-jefflexu@linux.alibaba.com>
In-Reply-To: <20211210073619.21667-1-jefflexu@linux.alibaba.com>
References: <20211210073619.21667-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [RFC 02/19] cachefiles: implement key scheme for
	demand-read mode
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In demand-read mode, user daemon may prepare data blob files in advance
before they are lookud up.

Thus simplify the logic of placing backing files, in which backing files
are under "cache/<volume>/" directory directly.

Also skip coherency checking currently to ease the development and debug.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/namei.c | 8 +++++++-
 fs/cachefiles/xattr.c | 5 +++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index 61d412580353..981e6e80690b 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -603,11 +603,17 @@ static bool cachefiles_open_file(struct cachefiles_object *object,
 bool cachefiles_look_up_object(struct cachefiles_object *object)
 {
 	struct cachefiles_volume *volume = object->volume;
-	struct dentry *dentry, *fan = volume->fanout[(u8)object->cookie->key_hash];
+	struct cachefiles_cache *cache = volume->cache;
+	struct dentry *dentry, *fan;
 	int ret;
 
 	_enter("OBJ%x,%s,", object->debug_id, object->d_name);
 
+	if (cache->mode == CACHEFILES_MODE_CACHE)
+		fan = volume->fanout[(u8)object->cookie->key_hash];
+	else
+		fan = volume->dentry;
+
 	/* Look up path "cache/vol/fanout/file". */
 	ret = cachefiles_inject_read_error();
 	if (ret == 0)
diff --git a/fs/cachefiles/xattr.c b/fs/cachefiles/xattr.c
index 0601c46a22ef..f562dd0d4bdd 100644
--- a/fs/cachefiles/xattr.c
+++ b/fs/cachefiles/xattr.c
@@ -88,6 +88,7 @@ int cachefiles_set_object_xattr(struct cachefiles_object *object)
  */
 int cachefiles_check_auxdata(struct cachefiles_object *object, struct file *file)
 {
+	struct cachefiles_cache *cache = object->volume->cache;
 	struct cachefiles_xattr *buf;
 	struct dentry *dentry = file->f_path.dentry;
 	unsigned int len = object->cookie->aux_len, tlen;
@@ -96,6 +97,10 @@ int cachefiles_check_auxdata(struct cachefiles_object *object, struct file *file
 	ssize_t xlen;
 	int ret = -ESTALE;
 
+	/* TODO: coherency check */
+	if (cache->mode == CACHEFILES_MODE_DEMAND)
+		return 0;
+
 	tlen = sizeof(struct cachefiles_xattr) + len;
 	buf = kmalloc(tlen, GFP_KERNEL);
 	if (!buf)
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


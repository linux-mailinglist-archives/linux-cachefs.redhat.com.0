Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B155FEA17
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Oct 2022 10:06:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665734817;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/AsE26JlJASQ0SGfqzliLtmdgWADQDE7szxVK9Xem2I=;
	b=gPJ9cMwkn4THiq+P3KUejAoZHWfK+WA+mM7r8wx5p02Y8vzFP8KksAD8I2FACnz/AViUmF
	P+fTBCO/m1D2SGgH0fyOc8JNIHApz8f0S8PqixTR+svjSBoeOq4Rej0LPGIxK2koy2XdnI
	JUZcCIkc8mZFuxJTw+Fb90yh99n3gJw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-CxvubLZWML-WwcOYnp27jg-1; Fri, 14 Oct 2022 04:06:54 -0400
X-MC-Unique: CxvubLZWML-WwcOYnp27jg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AA2F2A2AD44;
	Fri, 14 Oct 2022 08:06:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED51656D29F;
	Fri, 14 Oct 2022 08:06:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 16B2D1946594;
	Fri, 14 Oct 2022 08:06:53 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0B6241946587 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 14 Oct 2022 08:06:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D7EE940398C7; Fri, 14 Oct 2022 08:06:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D08BA40398B9
 for <linux-cachefs@redhat.com>; Fri, 14 Oct 2022 08:06:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE12429324BC
 for <linux-cachefs@redhat.com>; Fri, 14 Oct 2022 08:06:50 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-CH8FCnXQNSeFs8ONYmiIVA-1; Fri, 14 Oct 2022 04:06:48 -0400
X-MC-Unique: CH8FCnXQNSeFs8ONYmiIVA-1
Received: by mail-pj1-f45.google.com with SMTP id
 t12-20020a17090a3b4c00b0020b04251529so4107198pjf.5
 for <linux-cachefs@redhat.com>; Fri, 14 Oct 2022 01:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8u8C9HdOyOb3+ICBwFZcrFBPJwehJIZsy+qDOHaF19g=;
 b=4lJhWC2GHoZKM8mr9pjKqx4jwwBVsY+Xg0vQY23VS29ECoULg9w/h2oJlgb1DapUNK
 Qn3JRxJLoSZq+B5PkxLtRkHLodf7FeWiXHu8TBAQszTEHvjz3R3ktcwOUCuJHS4zzopj
 pCDYmdL2HLF9eXc9TTIBBmhjGMqm2VR4Ga0dfkJIAC7qHQfoN8GwKGAjlMj7QeH5iBwT
 padM5Mwt9ITtOqOYBJMuUt37H7G2u2MMvQvngX/XXVZRcjcsmi7crrWLfrj0a61tXq5R
 CjSh0BWpgud3MHAejKd6ABx4r1ufAtQX38F5DzmBVAfl1wys8/A14Hz35/ncju+kN/EQ
 1E8Q==
X-Gm-Message-State: ACrzQf0mYEeY8exety1sAC22lo2fa8u+eoOwl+E+7ghSgaaieQ4E6/yP
 h37gO+52Fd38EeZ1C+oPoN46W0kZgQMCr15D
X-Google-Smtp-Source: AMsMyM7TCUHthbVDEp84KteEgCPGCvN3NhsLBH4YrIOYaqV0E051pLrr551rlUd5+pw1LXug+HVuIA==
X-Received: by 2002:a17:902:b901:b0:184:5b9a:24f0 with SMTP id
 bf1-20020a170902b90100b001845b9a24f0mr4142759plb.17.1665734807934; 
 Fri, 14 Oct 2022 01:06:47 -0700 (PDT)
Received: from C02G705SMD6V.bytedance.net ([63.216.146.188])
 by smtp.gmail.com with ESMTPSA id
 ik20-20020a170902ab1400b001730a1af0fbsm1119196plb.23.2022.10.14.01.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:06:47 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	xiang@kernel.org,
	jefflexu@linux.alibaba.com
Date: Fri, 14 Oct 2022 16:05:58 +0800
Message-Id: <20221014080559.42108-5-zhujia.zj@bytedance.com>
In-Reply-To: <20221014080559.42108-1-zhujia.zj@bytedance.com>
References: <20221014080559.42108-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH V3 4/5] cachefiles: narrow the scope of
 triggering EPOLLIN events in ondemand mode
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
Cc: linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't trigger EPOLLIN when there are only reopening read requests in
xarray.

Suggested-by: Xin Yin <yinxin.x@bytedance.com>
Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/daemon.c   | 13 +++++++++++--
 fs/cachefiles/internal.h | 12 ++++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index aa4efcabb5e3..c74bd1f4ecf5 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -355,14 +355,23 @@ static __poll_t cachefiles_daemon_poll(struct file *file,
 					   struct poll_table_struct *poll)
 {
 	struct cachefiles_cache *cache = file->private_data;
+	struct xarray *xa = &cache->reqs;
+	struct cachefiles_req *req;
+	unsigned long index;
 	__poll_t mask;
 
 	poll_wait(file, &cache->daemon_pollwq, poll);
 	mask = 0;
 
 	if (cachefiles_in_ondemand_mode(cache)) {
-		if (!xa_empty(&cache->reqs))
-			mask |= EPOLLIN;
+		if (!xa_empty(xa)) {
+			xa_for_each_marked(xa, index, req, CACHEFILES_REQ_NEW) {
+				if (!cachefiles_ondemand_is_reopening_read(req)) {
+					mask |= EPOLLIN;
+					break;
+				}
+			}
+		}
 	} else {
 		if (test_bit(CACHEFILES_STATE_CHANGED, &cache->flags))
 			mask |= EPOLLIN;
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 2ed836d4169e..3d94990a8b38 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -326,6 +326,13 @@ cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
 CACHEFILES_OBJECT_STATE_FUNCS(open);
 CACHEFILES_OBJECT_STATE_FUNCS(close);
 CACHEFILES_OBJECT_STATE_FUNCS(reopening);
+
+static inline bool cachefiles_ondemand_is_reopening_read(struct cachefiles_req *req)
+{
+	return cachefiles_ondemand_object_is_reopening(req->object) &&
+			req->msg.opcode == CACHEFILES_OP_READ;
+}
+
 #else
 static inline ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 					char __user *_buffer, size_t buflen)
@@ -353,6 +360,11 @@ static inline int cachefiles_ondemand_init_obj_info(struct cachefiles_object *ob
 {
 	return 0;
 }
+
+static inline bool cachefiles_ondemand_is_reopening_read(struct cachefiles_req *req)
+{
+	return false;
+}
 #endif
 
 /*
-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


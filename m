Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A52502A11
	for <lists+linux-cachefs@lfdr.de>; Fri, 15 Apr 2022 14:36:48 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-U8dGCxUaOIi5s_2jF2At1w-1; Fri, 15 Apr 2022 08:36:44 -0400
X-MC-Unique: U8dGCxUaOIi5s_2jF2At1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10B5218812C5;
	Fri, 15 Apr 2022 12:36:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0748EC44CD0;
	Fri, 15 Apr 2022 12:36:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 71754194036E;
	Fri, 15 Apr 2022 12:36:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EDBA619451EF for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 15 Apr 2022 12:36:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CEE7F7AE3; Fri, 15 Apr 2022 12:36:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA90D7ADF
 for <linux-cachefs@redhat.com>; Fri, 15 Apr 2022 12:36:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E2E3802803
 for <linux-cachefs@redhat.com>; Fri, 15 Apr 2022 12:36:40 +0000 (UTC)
Received: from out199-3.us.a.mail.aliyun.com (out199-3.us.a.mail.aliyun.com
 [47.90.199.3]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-D2Rgh3PLNMW7OSjgUXFSJQ-1; Fri, 15 Apr 2022 08:36:34 -0400
X-MC-Unique: D2Rgh3PLNMW7OSjgUXFSJQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0VA7Y1b1_1650026187
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VA7Y1b1_1650026187) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 15 Apr 2022 20:36:28 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 15 Apr 2022 20:36:01 +0800
Message-Id: <20220415123614.54024-9-jefflexu@linux.alibaba.com>
In-Reply-To: <20220415123614.54024-1-jefflexu@linux.alibaba.com>
References: <20220415123614.54024-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Linux-cachefs] [PATCH v9 08/21] cachefiles: document on-demand
 read mode
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
Cc: gregkh@linuxfoundation.org, fannaihao@baidu.com, tao.peng@linux.alibaba.com,
 willy@infradead.org, linux-kernel@vger.kernel.org, tianzichen@kuaishou.com,
 joseph.qi@linux.alibaba.com, zhangjiachen.jaycee@bytedance.com,
 bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
 luodaowen.backend@bytedance.com, eguan@linux.alibaba.com,
 gerry@linux.alibaba.com, torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Document new user interface introduced by on-demand read mode.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 .../filesystems/caching/cachefiles.rst        | 170 ++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/Documentation/filesystems/caching/cachefiles.rst b/Documentation/filesystems/caching/cachefiles.rst
index 8bf396b76359..c10a16957141 100644
--- a/Documentation/filesystems/caching/cachefiles.rst
+++ b/Documentation/filesystems/caching/cachefiles.rst
@@ -28,6 +28,7 @@ Cache on Already Mounted Filesystem
 
  (*) Debugging.
 
+ (*) On-demand Read.
 
 
 Overview
@@ -482,3 +483,172 @@ the control file.  For example::
 	echo $((1|4|8)) >/sys/module/cachefiles/parameters/debug
 
 will turn on all function entry debugging.
+
+
+On-demand Read
+==============
+
+When working in its original mode, cachefiles mainly serves as a local cache
+for a remote networking fs - while in on-demand read mode, cachefiles can boost
+the scenario where on-demand read semantics is needed, e.g. container image
+distribution.
+
+The essential difference between these two modes is that, in original mode,
+when a cache miss occurs, the netfs will fetch the data from the remote server
+and then write it to the cache file.  With on-demand read mode, however,
+fetching the data and writing it into the cache is delegated to a user daemon.
+
+``CONFIG_CACHEFILES_ONDEMAND`` should be enabled to support on-demand read mode.
+
+
+Protocol Communication
+----------------------
+
+The on-demand read mode relies on a simple protocol used for communication
+between kernel and user daemon. The protocol can be modeled as::
+
+	kernel --[request]--> user daemon --[reply]--> kernel
+
+The cachefiles kernel module will send requests to the user daemon when needed.
+The user daemon needs to poll on the devnode ('/dev/cachefiles') to check if
+there's a pending request to be processed.  A POLLIN event will be returned
+when there's a pending request.
+
+The user daemon then reads the devnode to fetch a request and process it
+accordingly.  It is worth noting that each read only gets one request. When
+finished processing the request, the user daemon needs to write the reply to
+the devnode.
+
+Each request starts with a message header of the form::
+
+	struct cachefiles_msg {
+		__u32 msg_id;
+		__u32 opcode;
+		__u32 len;
+		__u32 object_id;
+		__u8  data[];
+	};
+
+	where:
+
+	* ``msg_id`` is a unique ID identifying this request among all pending
+	  requests.
+
+	* ``opcode`` indicates the type of this request.
+
+	* ``object_id`` is a unique ID identifying the cache file operated on.
+
+	* ``data`` indicates the payload of this request.
+
+	* ``len`` indicates the whole length of this request, including the
+	  header and following type-specific payload.
+
+
+Turn on On-demand Mode
+----------------------
+
+An optional parameter is added to the "bind" command::
+
+	bind [ondemand]
+
+When the "bind" command takes without argument, it defaults to the original
+mode.  When the "bind" command is given the "ondemand" argument, i.e.
+"bind ondemand", on-demand read mode will be enabled.
+
+
+The OPEN Request
+----------------
+
+When the netfs opens a cache file for the first time, a request with the
+CACHEFILES_OP_OPEN opcode, a.k.a an OPEN request will be sent to the user
+daemon.  The payload format is of the form::
+
+	struct cachefiles_open {
+		__u32 volume_key_size;
+		__u32 cookie_key_size;
+		__u32 fd;
+		__u32 flags;
+		__u8  data[];
+	};
+
+	where:
+
+	* ``data`` contains the volume_key followed directly by the cookie_key.
+	  The volume key is a NUL-terminated string; the cookie key is binary
+	  data.
+
+	* ``volume_key_size`` indicates the size of the volume key in bytes.
+
+	* ``cookie_key_size`` indicates the size of the cookie key in bytes.
+
+	* ``fd`` indicates an anonymous fd referring to the cache file, through
+	  which the user daemon can perform write/llseek file operations on the
+	  cache file.
+
+
+The user daemon is able to distinguish the requested cache file with the given
+(volume_key, cookie_key) pair. Each cache file has a unique object_id, while it
+may have multiple anonymous fds. The user daemon may duplicate anonymous fds
+from the initial anonymous fd indicated by the @fd field through dup(). Thus
+each object_id can be mapped to multiple anonymous fds, while the usr daemon
+itself needs to maintain the mapping.
+
+With the given anonymous fd, the user daemon can fetch data and write it to the
+cache file in the background, even when kernel has not triggered a cache miss
+yet.
+
+The user daemon should complete the READ request by issuing a "copen" (complete
+open) command on the devnode::
+
+	copen <msg_id>,<cache_size>
+
+	* ``msg_id`` must match the msg_id field of the previous OPEN request.
+
+	* When >= 0, ``cache_size`` indicates the size of the cache file;
+	  when < 0, ``cache_size`` indicates the error code ecountered by the
+	  user daemon.
+
+
+The CLOSE Request
+-----------------
+
+When a cookie withdrawn, a CLOSE request (opcode CACHEFILES_OP_CLOSE) will be
+sent to the user daemon. It will notify the user daemon to close all anonymous
+fds associated with the given object_id.  The CLOSE request has no extea
+payload.
+
+
+The READ Request
+----------------
+
+When on-demand read mode is turned on, and a cache miss encountered, the kernel
+will send a READ request (opcode CACHEFILES_OP_READ) to the user daemon. This
+will tell the user daemon to fetch data of the requested file range. The payload
+is of the form::
+
+	struct cachefiles_read {
+		__u64 off;
+		__u64 len;
+	};
+
+	where:
+
+	* ``off`` indicates the starting offset of the requested file range.
+
+	* ``len`` indicates the length of the requested file range.
+
+
+When receiving a READ request, the user daemon needs to fetch the data of the
+requested file range, and then write it to the cache file identified by
+object_id.
+
+To finish processing the READ request, the user daemon should reply with the
+CACHEFILES_IOC_CREAD ioctl on one of the anonymous fds associated with the given
+object_id in the READ request.  The ioctl is of the form::
+
+	ioctl(fd, CACHEFILES_IOC_CREAD, msg_id);
+
+	* ``fd`` is one of the anonymous fds associated with the given object_id
+	  in the READ request.
+
+	* ``msg_id`` must match the msg_id field of the previous READ request.
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


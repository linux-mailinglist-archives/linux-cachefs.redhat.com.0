Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F474F5700
	for <lists+linux-cachefs@lfdr.de>; Wed,  6 Apr 2022 09:56:36 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-NvX9KTtfPWi3N-VsducIBQ-1; Wed, 06 Apr 2022 03:56:35 -0400
X-MC-Unique: NvX9KTtfPWi3N-VsducIBQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73C331C01507;
	Wed,  6 Apr 2022 07:56:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 691BDC1914E;
	Wed,  6 Apr 2022 07:56:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2F4A0194036B;
	Wed,  6 Apr 2022 07:56:34 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ACBF919451F3 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 07:56:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9DC6940CF910; Wed,  6 Apr 2022 07:56:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9915540CF905
 for <linux-cachefs@redhat.com>; Wed,  6 Apr 2022 07:56:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD3E3802809
 for <linux-cachefs@redhat.com>; Wed,  6 Apr 2022 07:56:31 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-JSqCU2nsPYS-6F0VVA4eiA-1; Wed, 06 Apr 2022 03:56:28 -0400
X-MC-Unique: JSqCU2nsPYS-6F0VVA4eiA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V9L0qr._1649231783
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V9L0qr._1649231783) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 06 Apr 2022 15:56:24 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Wed,  6 Apr 2022 15:55:59 +0800
Message-Id: <20220406075612.60298-8-jefflexu@linux.alibaba.com>
In-Reply-To: <20220406075612.60298-1-jefflexu@linux.alibaba.com>
References: <20220406075612.60298-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Linux-cachefs] [PATCH v8 07/20] cachefiles: document on-demand
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
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
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
 .../filesystems/caching/cachefiles.rst        | 165 ++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/Documentation/filesystems/caching/cachefiles.rst b/Documentation/filesystems/caching/cachefiles.rst
index 8bf396b76359..386801135027 100644
--- a/Documentation/filesystems/caching/cachefiles.rst
+++ b/Documentation/filesystems/caching/cachefiles.rst
@@ -28,6 +28,8 @@ Cache on Already Mounted Filesystem
 
  (*) Debugging.
 
+ (*) On-demand Read.
+
 
 
 Overview
@@ -482,3 +484,166 @@ the control file.  For example::
 	echo $((1|4|8)) >/sys/module/cachefiles/parameters/debug
 
 will turn on all function entry debugging.
+
+
+On-demand Read
+==============
+
+When working in original mode, cachefiles mainly serves as a local cache for
+remote networking fs, while in on-demand read mode, cachefiles can boost the
+scenario where on-demand read semantics is needed, e.g. container image
+distribution.
+
+The essential difference between these two modes is that, in original mode,
+when cache miss, netfs itself will fetch data from remote, and then write the
+fetched data into cache file. While in on-demand read mode, a user daemon is
+responsible for fetching data and then writing to the cache file.
+
+``CONFIG_CACHEFILES_ONDEMAND`` shall be enabled to support on-demand read mode.
+
+
+Protocol Communication
+----------------------
+
+The on-demand read mode relies on a simple protocol used for communication
+between kernel and user daemon. The model is like::
+
+	kernel --[request]--> user daemon --[reply]--> kernel
+
+The cachefiles kernel module will send requests to user daemon when needed.
+User daemon needs to poll on the devnode ('/dev/cachefiles') to check if
+there's pending request to be processed. A POLLIN event will be returned
+when there's pending request.
+
+Then user daemon needs to read the devnode to fetch one request and process it
+accordingly. It is worth nothing that each read only gets one request. When
+finished processing the request, user daemon needs to write the reply to the
+devnode.
+
+Each request is started with a message header like::
+
+	struct cachefiles_msg {
+		__u32 id;
+		__u32 opcode;
+		__u32 len;
+		__u8  data[];
+	};
+
+	* ``id`` is a unique ID identifying this request among all pending
+	  requests.
+
+	* ``opcode`` identifies the type of this request.
+
+	* ``data`` identifies the payload of this request.
+
+	* ``len`` identifies the whole length of this request, including the
+	  header and following type specific payload.
+
+
+Turn on On-demand Mode
+----------------------
+
+An optional parameter is added to "bind" command::
+
+	bind [ondemand]
+
+When "bind" command takes without argument, it defaults to the original mode.
+When "bind" command takes with "ondemand" argument, i.e. "bind ondemand",
+on-demand read mode will be enabled.
+
+
+OPEN Request
+------------
+
+When netfs opens a cache file for the first time, a request with
+CACHEFILES_OP_OPEN opcode, a.k.a OPEN request will be sent to user daemon. The
+payload format is like::
+
+	struct cachefiles_open {
+		__u32 volume_key_size;
+		__u32 cookie_key_size;
+		__u32 fd;
+		__u32 flags;
+		__u8  data[];
+	};
+
+	* ``data`` contains volume_key and cookie_key in sequence.
+
+	* ``volume_key_size`` identifies the size of volume key of the cache
+	  file, in bytes. volume_key is of string format, with a suffix '\0'.
+
+	* ``cookie_key_size`` identifies the size of cookie key of the cache
+	  file, in bytes. cookie_key is of binary format, which is netfs
+	  specific.
+
+	* ``fd`` identifies the anonymous fd of the cache file, with which user
+	  daemon can perform write/llseek file operations on the cache file.
+
+
+OPEN request contains (volume_key, cookie_key, anon_fd) triple for corresponding
+cache file. With this triple, user daemon could fetch and write data into the
+cache file in the background, even when kernel has not triggered the cache miss
+yet. User daemon is able to distinguish the requested cache file with the given
+(volume_key, cookie_key), and write the fetched data into cache file with the
+given anon_fd.
+
+After recording the (volume_key, cookie_key, anon_fd) triple, user daemon shall
+reply with "copen" (complete open) command::
+
+	copen <id>,<cache_size>
+
+	* ``id`` is exactly the id field of the previous OPEN request.
+
+	* When >= 0, ``cache_size`` identifies the size of the cache file;
+	  when < 0, ``cache_size`` identifies the error code ecountered by the
+	  user daemon.
+
+
+CLOSE Request
+-------------
+When cookie withdrawed, a request with CACHEFILES_OP_CLOSE opcode, a.k.a CLOSE
+request, will be sent to user daemon. It will notify user daemon to close the
+attached anon_fd. The payload format is like::
+
+	struct cachefiles_close {
+		__u32 fd;
+	};
+
+	* ``fd`` identifies the anon_fd to be closed, which is exactly the same
+	  with that in OPEN request.
+
+
+READ Request
+------------
+
+When on-demand read mode is turned on, and cache miss encountered, kernel will
+send a request with CACHEFILES_OP_READ opcode, a.k.a READ request, to user
+daemon. It will notify user daemon to fetch data in the requested file range.
+The payload format is like::
+
+	struct cachefiles_read {
+		__u64 off;
+		__u64 len;
+		__u32 fd;
+	};
+
+	* ``off`` identifies the starting offset of the requested file range.
+
+	* ``len`` identifies the length of the requested file range.
+
+	* ``fd`` identifies the anonymous fd of the requested cache file. It is
+	  guaranteed that it shall be the same with the fd field in the previous
+	  OPEN request.
+
+When receiving one READ request, user daemon needs to fetch data of the
+requested file range, and then write the fetched data into cache file with the
+given anonymous fd.
+
+When finished processing the READ request, user daemon needs to reply with
+CACHEFILES_IOC_CREAD ioctl on the corresponding anon_fd::
+
+	ioctl(fd, CACHEFILES_IOC_CREAD, id);
+
+	* ``fd`` is exactly the fd field of the previous READ request.
+
+	* ``id`` is exactly the id field of the previous READ request.
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


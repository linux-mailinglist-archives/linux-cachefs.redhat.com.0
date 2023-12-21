Return-Path: <linux-cachefs+bncBDLIXLMFVAERB7HYSCWAMGQEHV73MVI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F5E81B746
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:24:13 +0100 (CET)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-58d8dba1027sf57857eaf.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:24:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165052; cv=pass;
        d=google.com; s=arc-20160816;
        b=r8fy+UM93QSzYL80n+QKfvjFcxkqV4uISwUQUlE3X1VgHtzS67ZfKxSzxKeW2mAs7O
         Pm7MTVz4u0FZQBFg3s3Z7IRJ4Ulds4v3cWdX4vHGg8TyhxIsAKikhI2ogRPyi78D0X5n
         DbE2rxR+f2vnXR+qMq4daub5+p+Hv8ImcnXtKF2wE9Un/xC7C22VfWDUdFP7A+ZCYJaY
         QKxfPXxZiezol2X6Z9l8o+793Cc7WxOqPmxdAJutFxNF41H9NwrVhG4A6JUuQPrfqHG6
         fPULAxhtJOnmN1iwp5RdYZVXOh/G1qyFMUAibFiABCzaPBsHVUS5Gpx93x30/RnmTZ3u
         YYpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=vKbIcCo8f58JWYiYSVYQboyf1EVNnZPIg/w2R88JGKM=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=PUXOgsGzYO0SX/948XK/nab3BlLcP9VvJbIwmseqPjfOhzLh6JE2D6SoEtdAiY4rCx
         VZxflCNyfXpGRaG93WJq+EwtoYW+DKOkz4LyVb2wicvF+aTse1RwtwO8XrbYtlr7Bc2q
         Td6ZRUADMi9UTScoaiEIFkwORYVIOMq9N5dE9ZhW1rBPOH7+lS43OlZc4H48WEIe3SD6
         jD5iUti0opZBbQIfBPAo3hNfjfuxeYNNx6lllT3GZFHRxbFA99ZQ9DbosGkyqgxTGyLZ
         Mxhk2WOpVHYyfb2yfT78+SANtqHeqzpIavj7erUaOfZGk+nFGKWox2S6MFaxNX9XpWbU
         peYw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165052; x=1703769852;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKbIcCo8f58JWYiYSVYQboyf1EVNnZPIg/w2R88JGKM=;
        b=o+r9LsXZVf1qcob+moyKxDokYJMeet3He03ZC3xAStDixYfZOwTYwAMDZDDihGS5od
         FT/+mXcITfEb9wrZH/mSn18OXJCiPeI3Pp07zZ1nZXWClJaGDtkzE4rg2QRMpMe/ox8W
         ZkjqnFmRv1GQ6yvSGoGH27slk08T/2mbz4TY7A18rr22dqmS4b49yoR/CZEKyVgImb5n
         veSg6Ea3ewU5JkYSbK6mDRuNqHBnMMcYZT3iafjRCQssc9AFuUS7lcYOvj3xkKNBETif
         BFOkCGZX5qr4/ZmUnQPGVYXjF8VkuC9w39D3k6F+C1HS4/NrR5d5wYKlCIZ3CrrqIvkZ
         +BJg==
X-Gm-Message-State: AOJu0YyNtpYhznrhUCl+ZPZFfYmRzU9t278+fKBpUT7ydW0tE64TEab8
	L5WGhCcT3hSM9x72KxhNXohsyw==
X-Google-Smtp-Source: AGHT+IFX1UbIvwYCMzh2mdppbln20WlesWMERmsm53JFBb9PHldx3qsupNpPlTYihCR3JveGaEQ9vw==
X-Received: by 2002:a4a:c993:0:b0:594:1ce9:18cd with SMTP id u19-20020a4ac993000000b005941ce918cdmr2209521ooq.0.1703165052126;
        Thu, 21 Dec 2023 05:24:12 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:1c8f:b0:58d:be41:d2a3 with SMTP id
 ct15-20020a0568201c8f00b0058dbe41d2a3ls243663oob.2.-pod-prod-01-us; Thu, 21
 Dec 2023 05:24:11 -0800 (PST)
X-Received: by 2002:a05:6808:17a6:b0:3bb:7bde:3bb2 with SMTP id bg38-20020a05680817a600b003bb7bde3bb2mr977940oib.33.1703165051490;
        Thu, 21 Dec 2023 05:24:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165051; cv=none;
        d=google.com; s=arc-20160816;
        b=HxjuXRKbA//3zWiAamC00WFq5rwMI3SIECsiEcy/LeC3OPEad/HCIZlbiu9ox5ckoK
         9kvrU+/WuIhTmtYdGl7v1yb/F0f4uZcY0Jkb33V+ZQ9yCPQXrF/8V5mEzGAH7NmddENV
         ITJLoCSmaTc8XLnCxnheeuv8Bf/QFfz4bKaVMX61B5JZcWu23S19q9Gi9F8al/tTSXQp
         lLKL0bcmvEOv0pwmgUjYl2/9pc9nbkAL29NST66bNy4aCSEpHkXbF9Vof0NahsLbYmkn
         DD/MlRUco0ySbdfLQln2rqNOFNp3vphIcJhmfWq1/D3nOL9+elUrKttWALppvBsJIn0X
         VQqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=uo7e1CTALt1we/Nqh6VRmDSjCN+RQpDofWlN35YXm2s=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=xyTqnod4IcEekR0eKXD6jwrmae/4psoM4fT6fJIZffX3caKz/k+g453mBehD4dTTRR
         SLrQTd2k78FSkyXFGxPNCGkYAPSDfai2SutlwdpvDAFFVPiV3fGh3+G+OC0WgviUV+ij
         Y2IrasdMx8eBSB6ALDCj4g5OVQ36tQk3MvCf9TRy2z0dlAkyFqHmy2/hJL1F712mlj7z
         xebz6tEiJ2fbuU3qPIzvMeRGVAhFz30NZVn3gt6I8PezyCWDDttq09DkId6BIsZfO0WE
         n21ZqgnZAthplcEi1w/ytamUoj2j4w1Cps7caz0Q3eJ3YFtRmkBANiETXFNF0gIE0Q8g
         CiGA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id x14-20020a0cb20e000000b0067f3dbabee4si2021937qvd.183.2023.12.21.05.24.11
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:24:11 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-438-KtLVgAkqOC6rUYdRh3nZRA-1; Thu,
 21 Dec 2023 08:24:09 -0500
X-MC-Unique: KtLVgAkqOC6rUYdRh3nZRA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADB733830089
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:24:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id A731E1C060B2; Thu, 21 Dec 2023 13:24:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 991261C060AF;
	Thu, 21 Dec 2023 13:24:06 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/40] afs: Remove whitespace before most ')' from the trace header
Date: Thu, 21 Dec 2023 13:22:56 +0000
Message-ID: <20231221132400.1601991-2-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

checkpatch objects to whitespace before ')', so remove most of it from the
afs trace header.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-afs@lists.infradead.org
cc: linux-fsdevel@vger.kernel.org
---
 include/trace/events/afs.h | 242 ++++++++++++++++++-------------------
 1 file changed, 121 insertions(+), 121 deletions(-)

diff --git a/include/trace/events/afs.h b/include/trace/events/afs.h
index e9d412d19dbb..cfcd6452c156 100644
--- a/include/trace/events/afs.h
+++ b/include/trace/events/afs.h
@@ -654,12 +654,12 @@ TRACE_EVENT(afs_receive_data,
 	    TP_ARGS(call, iter, want_more, ret),
 
 	    TP_STRUCT__entry(
-		    __field(loff_t,			remain		)
-		    __field(unsigned int,		call		)
-		    __field(enum afs_call_state,	state		)
-		    __field(unsigned short,		unmarshall	)
-		    __field(bool,			want_more	)
-		    __field(int,			ret		)
+		    __field(loff_t,			remain)
+		    __field(unsigned int,		call)
+		    __field(enum afs_call_state,	state)
+		    __field(unsigned short,		unmarshall)
+		    __field(bool,			want_more)
+		    __field(int,			ret)
 			     ),
 
 	    TP_fast_assign(
@@ -686,9 +686,9 @@ TRACE_EVENT(afs_notify_call,
 	    TP_ARGS(rxcall, call),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		call		)
-		    __field(enum afs_call_state,	state		)
-		    __field(unsigned short,		unmarshall	)
+		    __field(unsigned int,		call)
+		    __field(enum afs_call_state,	state)
+		    __field(unsigned short,		unmarshall)
 			     ),
 
 	    TP_fast_assign(
@@ -708,9 +708,9 @@ TRACE_EVENT(afs_cb_call,
 	    TP_ARGS(call),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		call		)
-		    __field(u32,			op		)
-		    __field(u16,			service_id	)
+		    __field(unsigned int,		call)
+		    __field(u32,			op)
+		    __field(u16,			service_id)
 			     ),
 
 	    TP_fast_assign(
@@ -733,11 +733,11 @@ TRACE_EVENT(afs_call,
 	    TP_ARGS(call_debug_id, op, ref, outstanding, where),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		call		)
-		    __field(int,			op		)
-		    __field(int,			ref		)
-		    __field(int,			outstanding	)
-		    __field(const void *,		where		)
+		    __field(unsigned int,		call)
+		    __field(int,			op)
+		    __field(int,			ref)
+		    __field(int,			outstanding)
+		    __field(const void *,		where)
 			     ),
 
 	    TP_fast_assign(
@@ -762,9 +762,9 @@ TRACE_EVENT(afs_make_fs_call,
 	    TP_ARGS(call, fid),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		call		)
-		    __field(enum afs_fs_operation,	op		)
-		    __field_struct(struct afs_fid,	fid		)
+		    __field(unsigned int,		call)
+		    __field(enum afs_fs_operation,	op)
+		    __field_struct(struct afs_fid,	fid)
 			     ),
 
 	    TP_fast_assign(
@@ -794,10 +794,10 @@ TRACE_EVENT(afs_make_fs_calli,
 	    TP_ARGS(call, fid, i),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		call		)
-		    __field(unsigned int,		i		)
-		    __field(enum afs_fs_operation,	op		)
-		    __field_struct(struct afs_fid,	fid		)
+		    __field(unsigned int,		call)
+		    __field(unsigned int,		i)
+		    __field(enum afs_fs_operation,	op)
+		    __field_struct(struct afs_fid,	fid)
 			     ),
 
 	    TP_fast_assign(
@@ -829,10 +829,10 @@ TRACE_EVENT(afs_make_fs_call1,
 	    TP_ARGS(call, fid, name),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		call		)
-		    __field(enum afs_fs_operation,	op		)
-		    __field_struct(struct afs_fid,	fid		)
-		    __array(char,			name, 24	)
+		    __field(unsigned int,		call)
+		    __field(enum afs_fs_operation,	op)
+		    __field_struct(struct afs_fid,	fid)
+		    __array(char,			name, 24)
 			     ),
 
 	    TP_fast_assign(
@@ -866,11 +866,11 @@ TRACE_EVENT(afs_make_fs_call2,
 	    TP_ARGS(call, fid, name, name2),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		call		)
-		    __field(enum afs_fs_operation,	op		)
-		    __field_struct(struct afs_fid,	fid		)
-		    __array(char,			name, 24	)
-		    __array(char,			name2, 24	)
+		    __field(unsigned int,		call)
+		    __field(enum afs_fs_operation,	op)
+		    __field_struct(struct afs_fid,	fid)
+		    __array(char,			name, 24)
+		    __array(char,			name2, 24)
 			     ),
 
 	    TP_fast_assign(
@@ -907,8 +907,8 @@ TRACE_EVENT(afs_make_vl_call,
 	    TP_ARGS(call),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		call		)
-		    __field(enum afs_vl_operation,	op		)
+		    __field(unsigned int,		call)
+		    __field(enum afs_vl_operation,	op)
 			     ),
 
 	    TP_fast_assign(
@@ -927,10 +927,10 @@ TRACE_EVENT(afs_call_done,
 	    TP_ARGS(call),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		call		)
-		    __field(struct rxrpc_call *,	rx_call		)
-		    __field(int,			ret		)
-		    __field(u32,			abort_code	)
+		    __field(unsigned int,		call)
+		    __field(struct rxrpc_call *,	rx_call)
+		    __field(int,			ret)
+		    __field(u32,			abort_code)
 			     ),
 
 	    TP_fast_assign(
@@ -953,10 +953,10 @@ TRACE_EVENT(afs_send_data,
 	    TP_ARGS(call, msg),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		call		)
-		    __field(unsigned int,		flags		)
-		    __field(loff_t,			offset		)
-		    __field(loff_t,			count		)
+		    __field(unsigned int,		call)
+		    __field(unsigned int,		flags)
+		    __field(loff_t,			offset)
+		    __field(loff_t,			count)
 			     ),
 
 	    TP_fast_assign(
@@ -977,10 +977,10 @@ TRACE_EVENT(afs_sent_data,
 	    TP_ARGS(call, msg, ret),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		call		)
-		    __field(int,			ret		)
-		    __field(loff_t,			offset		)
-		    __field(loff_t,			count		)
+		    __field(unsigned int,		call)
+		    __field(int,			ret)
+		    __field(loff_t,			offset)
+		    __field(loff_t,			count)
 			     ),
 
 	    TP_fast_assign(
@@ -1001,9 +1001,9 @@ TRACE_EVENT(afs_dir_check_failed,
 	    TP_ARGS(vnode, off, i_size),
 
 	    TP_STRUCT__entry(
-		    __field(struct afs_vnode *,		vnode		)
-		    __field(loff_t,			off		)
-		    __field(loff_t,			i_size		)
+		    __field(struct afs_vnode *,		vnode)
+		    __field(loff_t,			off)
+		    __field(loff_t,			i_size)
 			     ),
 
 	    TP_fast_assign(
@@ -1022,11 +1022,11 @@ TRACE_EVENT(afs_folio_dirty,
 	    TP_ARGS(vnode, where, folio),
 
 	    TP_STRUCT__entry(
-		    __field(struct afs_vnode *,		vnode		)
-		    __field(const char *,		where		)
-		    __field(pgoff_t,			index		)
-		    __field(unsigned long,		from		)
-		    __field(unsigned long,		to		)
+		    __field(struct afs_vnode *,		vnode)
+		    __field(const char *,		where)
+		    __field(pgoff_t,			index)
+		    __field(unsigned long,		from)
+		    __field(unsigned long,		to)
 			     ),
 
 	    TP_fast_assign(
@@ -1056,11 +1056,11 @@ TRACE_EVENT(afs_call_state,
 	    TP_ARGS(call, from, to, ret, remote_abort),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		call		)
-		    __field(enum afs_call_state,	from		)
-		    __field(enum afs_call_state,	to		)
-		    __field(int,			ret		)
-		    __field(u32,			abort		)
+		    __field(unsigned int,		call)
+		    __field(enum afs_call_state,	from)
+		    __field(enum afs_call_state,	to)
+		    __field(int,			ret)
+		    __field(u32,			abort)
 			     ),
 
 	    TP_fast_assign(
@@ -1084,9 +1084,9 @@ TRACE_EVENT(afs_lookup,
 	    TP_ARGS(dvnode, name, fid),
 
 	    TP_STRUCT__entry(
-		    __field_struct(struct afs_fid,	dfid		)
-		    __field_struct(struct afs_fid,	fid		)
-		    __array(char,			name, 24	)
+		    __field_struct(struct afs_fid,	dfid)
+		    __field_struct(struct afs_fid,	fid)
+		    __array(char,			name, 24)
 			     ),
 
 	    TP_fast_assign(
@@ -1116,15 +1116,15 @@ TRACE_EVENT(afs_edit_dir,
 	    TP_ARGS(dvnode, why, op, block, slot, f_vnode, f_unique, name),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		vnode		)
-		    __field(unsigned int,		unique		)
-		    __field(enum afs_edit_dir_reason,	why		)
-		    __field(enum afs_edit_dir_op,	op		)
-		    __field(unsigned int,		block		)
-		    __field(unsigned short,		slot		)
-		    __field(unsigned int,		f_vnode		)
-		    __field(unsigned int,		f_unique	)
-		    __array(char,			name, 24	)
+		    __field(unsigned int,		vnode)
+		    __field(unsigned int,		unique)
+		    __field(enum afs_edit_dir_reason,	why)
+		    __field(enum afs_edit_dir_op,	op)
+		    __field(unsigned int,		block)
+		    __field(unsigned short,		slot)
+		    __field(unsigned int,		f_vnode)
+		    __field(unsigned int,		f_unique)
+		    __array(char,			name, 24)
 			     ),
 
 	    TP_fast_assign(
@@ -1157,8 +1157,8 @@ TRACE_EVENT(afs_protocol_error,
 	    TP_ARGS(call, cause),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		call		)
-		    __field(enum afs_eproto_cause,	cause		)
+		    __field(unsigned int,		call)
+		    __field(enum afs_eproto_cause,	cause)
 			     ),
 
 	    TP_fast_assign(
@@ -1177,9 +1177,9 @@ TRACE_EVENT(afs_io_error,
 	    TP_ARGS(call, error, where),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,	call		)
-		    __field(int,		error		)
-		    __field(enum afs_io_error,	where		)
+		    __field(unsigned int,	call)
+		    __field(int,		error)
+		    __field(enum afs_io_error,	where)
 			     ),
 
 	    TP_fast_assign(
@@ -1199,9 +1199,9 @@ TRACE_EVENT(afs_file_error,
 	    TP_ARGS(vnode, error, where),
 
 	    TP_STRUCT__entry(
-		    __field_struct(struct afs_fid,	fid		)
-		    __field(int,			error		)
-		    __field(enum afs_file_error,	where		)
+		    __field_struct(struct afs_fid,	fid)
+		    __field(int,			error)
+		    __field(enum afs_file_error,	where)
 			     ),
 
 	    TP_fast_assign(
@@ -1222,9 +1222,9 @@ TRACE_EVENT(afs_cm_no_server,
 	    TP_ARGS(call, srx),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,			call	)
-		    __field(unsigned int,			op_id	)
-		    __field_struct(struct sockaddr_rxrpc,	srx	)
+		    __field(unsigned int,			call)
+		    __field(unsigned int,			op_id)
+		    __field_struct(struct sockaddr_rxrpc,	srx)
 			     ),
 
 	    TP_fast_assign(
@@ -1243,9 +1243,9 @@ TRACE_EVENT(afs_cm_no_server_u,
 	    TP_ARGS(call, uuid),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,			call	)
-		    __field(unsigned int,			op_id	)
-		    __field_struct(uuid_t,			uuid	)
+		    __field(unsigned int,			call)
+		    __field(unsigned int,			op_id)
+		    __field_struct(uuid_t,			uuid)
 			     ),
 
 	    TP_fast_assign(
@@ -1265,11 +1265,11 @@ TRACE_EVENT(afs_flock_ev,
 	    TP_ARGS(vnode, fl, event, error),
 
 	    TP_STRUCT__entry(
-		    __field_struct(struct afs_fid,	fid		)
-		    __field(enum afs_flock_event,	event		)
-		    __field(enum afs_lock_state,	state		)
-		    __field(int,			error		)
-		    __field(unsigned int,		debug_id	)
+		    __field_struct(struct afs_fid,	fid)
+		    __field(enum afs_flock_event,	event)
+		    __field(enum afs_lock_state,	state)
+		    __field(int,			error)
+		    __field(unsigned int,		debug_id)
 			     ),
 
 	    TP_fast_assign(
@@ -1295,13 +1295,13 @@ TRACE_EVENT(afs_flock_op,
 	    TP_ARGS(vnode, fl, op),
 
 	    TP_STRUCT__entry(
-		    __field_struct(struct afs_fid,	fid		)
-		    __field(loff_t,			from		)
-		    __field(loff_t,			len		)
-		    __field(enum afs_flock_operation,	op		)
-		    __field(unsigned char,		type		)
-		    __field(unsigned int,		flags		)
-		    __field(unsigned int,		debug_id	)
+		    __field_struct(struct afs_fid,	fid)
+		    __field(loff_t,			from)
+		    __field(loff_t,			len)
+		    __field(enum afs_flock_operation,	op)
+		    __field(unsigned char,		type)
+		    __field(unsigned int,		flags)
+		    __field(unsigned int,		debug_id)
 			     ),
 
 	    TP_fast_assign(
@@ -1328,7 +1328,7 @@ TRACE_EVENT(afs_reload_dir,
 	    TP_ARGS(vnode),
 
 	    TP_STRUCT__entry(
-		    __field_struct(struct afs_fid,	fid		)
+		    __field_struct(struct afs_fid,	fid)
 			     ),
 
 	    TP_fast_assign(
@@ -1345,8 +1345,8 @@ TRACE_EVENT(afs_silly_rename,
 	    TP_ARGS(vnode, done),
 
 	    TP_STRUCT__entry(
-		    __field_struct(struct afs_fid,	fid		)
-		    __field(bool,			done		)
+		    __field_struct(struct afs_fid,	fid)
+		    __field(bool,			done)
 			     ),
 
 	    TP_fast_assign(
@@ -1365,9 +1365,9 @@ TRACE_EVENT(afs_get_tree,
 	    TP_ARGS(cell, volume),
 
 	    TP_STRUCT__entry(
-		    __field(u64,			vid		)
-		    __array(char,			cell, 24	)
-		    __array(char,			volume, 24	)
+		    __field(u64,			vid)
+		    __array(char,			cell, 24)
+		    __array(char,			volume, 24)
 			     ),
 
 	    TP_fast_assign(
@@ -1392,10 +1392,10 @@ TRACE_EVENT(afs_cb_break,
 	    TP_ARGS(fid, cb_break, reason, skipped),
 
 	    TP_STRUCT__entry(
-		    __field_struct(struct afs_fid,	fid		)
-		    __field(unsigned int,		cb_break	)
-		    __field(enum afs_cb_break_reason,	reason		)
-		    __field(bool,			skipped		)
+		    __field_struct(struct afs_fid,	fid)
+		    __field(unsigned int,		cb_break)
+		    __field(enum afs_cb_break_reason,	reason)
+		    __field(bool,			skipped)
 			     ),
 
 	    TP_fast_assign(
@@ -1418,8 +1418,8 @@ TRACE_EVENT(afs_cb_miss,
 	    TP_ARGS(fid, reason),
 
 	    TP_STRUCT__entry(
-		    __field_struct(struct afs_fid,	fid		)
-		    __field(enum afs_cb_break_reason,	reason		)
+		    __field_struct(struct afs_fid,	fid)
+		    __field(enum afs_cb_break_reason,	reason)
 			     ),
 
 	    TP_fast_assign(
@@ -1439,10 +1439,10 @@ TRACE_EVENT(afs_server,
 	    TP_ARGS(server_debug_id, ref, active, reason),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		server		)
-		    __field(int,			ref		)
-		    __field(int,			active		)
-		    __field(int,			reason		)
+		    __field(unsigned int,		server)
+		    __field(int,			ref)
+		    __field(int,			active)
+		    __field(int,			reason)
 			     ),
 
 	    TP_fast_assign(
@@ -1465,9 +1465,9 @@ TRACE_EVENT(afs_volume,
 	    TP_ARGS(vid, ref, reason),
 
 	    TP_STRUCT__entry(
-		    __field(afs_volid_t,		vid		)
-		    __field(int,			ref		)
-		    __field(enum afs_volume_trace,	reason		)
+		    __field(afs_volid_t,		vid)
+		    __field(int,			ref)
+		    __field(enum afs_volume_trace,	reason)
 			     ),
 
 	    TP_fast_assign(
@@ -1489,10 +1489,10 @@ TRACE_EVENT(afs_cell,
 	    TP_ARGS(cell_debug_id, ref, active, reason),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		cell		)
-		    __field(int,			ref		)
-		    __field(int,			active		)
-		    __field(int,			reason		)
+		    __field(unsigned int,		cell)
+		    __field(int,			ref)
+		    __field(int,			active)
+		    __field(int,			reason)
 			     ),
 
 	    TP_fast_assign(

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


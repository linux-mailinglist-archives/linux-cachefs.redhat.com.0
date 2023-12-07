Return-Path: <linux-cachefs+bncBDLIXLMFVAERBIHPZCVQMGQEE7Z2GTA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id CE976809346
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:22:41 +0100 (CET)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-423dba1e166sf17424001cf.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:22:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984161; cv=pass;
        d=google.com; s=arc-20160816;
        b=YXAyQyHvcOw4pm9tO8RBsFwOFAejG80rtpWU4mP3Nsqu3tCt/eFpli94I8Fac3Ih6Z
         JkMD3HtIDDaHMAaV1N0cZzmzYiMrdagkQqCvbM3mZoeJblWXx141q6eiwaD2D7opfLnq
         ZRlXH8QBWp77jIXWsMMp0+qHj4etxmd+9ij/n+5MCswLmtA9jzfV8oGT1HNbSbPABby5
         BkOoyI+qLTh0M12KfHzjRt3aolDMxisz74enV1mhXF8lVSoFwHSFPyZPUNYIEG2GVHES
         lHBkU+5wXupdr2PQAh/qzIkNxtndhp7I7NJuRpoK3XR//6D9H65kAElTs0okmRPg0mY8
         m4Gg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=PYmkrNKmY9z7JDjorgdL7qqhyafvaZghAFQGNW9pvn0=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=GrKjbnSG08mLdFRtm6PXfs7nk7/dZo6v2YiQugcMXkZoIYcy8KpIQDfrAE7ATjNymb
         HxuNTZbIMHarVcNATAwu7Oq0htA22guZ/9iwV7B641BrA1DUVNYCTgUViFUGrenmcXX3
         cG4bF3ao3QZnFkfTG8aGBEmEtxCco3j0IGMBXti3u9tgg4NAaxw4WRh9Y9IpuDmQDYi9
         xAMF/rYmYjWfzop5pwscDGstva/eY/9apf4Lse8dbVoJTsqlZ1Tgr/OtoPZ7V2pM5O0/
         rxU5HtCV24gLR/PrRI14NBc24pD+b9QBZjJO1dGGL4WM/xzcuSte7jl1Hidwl8qv5Lup
         JnQA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984161; x=1702588961;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYmkrNKmY9z7JDjorgdL7qqhyafvaZghAFQGNW9pvn0=;
        b=U1L7HzT1xlzcnX/Zky6c3zXObPTCmV+IcXDsi2046RJB23MUJIjFzobpSRBfDoNFJD
         VwGQkXgh5y9PcVuriIKcc1P+/1txk56PlxXgZ/xOJ5nXcmQlpIB/v+m7PuLJ38dgpA+J
         1t2B6VVpJyj0/J/al6nDZG29s/ByTpYSFIKuzOvy75CFsonChkscrWBQotSl4llX1y3s
         Um669Z0AFaeX2myY35Z2QaCXq8tGZvZPTDjEBmyrMsVkguTyaiPEX4UqJjDbwjgYBU5w
         ziyfYYJZXjWjgA3TP0gJkLh50N/lOtc0huEjHDJkuxrQj1gnWkAjpKcOt3EMsLAV2wFH
         nXWA==
X-Gm-Message-State: AOJu0YzJnAv7utlyYshoEnrBKYq0vfkGevrVeeRvaDP4vlnzV9cfv+4e
	vnW1L3CLHuzOZhf8i9hFh1HOXg==
X-Google-Smtp-Source: AGHT+IFGZHleEhML40sx69la/OCE3xK0n5qQXKNsRD8VxcVGiQiYa596f2g8X2gW4Gxc/9HvCQwR5g==
X-Received: by 2002:a05:622a:d1:b0:423:6e27:adfa with SMTP id p17-20020a05622a00d100b004236e27adfamr4011054qtw.42.1701984160838;
        Thu, 07 Dec 2023 13:22:40 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1751:b0:423:9554:656a with SMTP id
 l17-20020a05622a175100b004239554656als506728qtk.1.-pod-prod-09-us; Thu, 07
 Dec 2023 13:22:40 -0800 (PST)
X-Received: by 2002:a05:620a:a87:b0:77f:3da0:61f7 with SMTP id v7-20020a05620a0a8700b0077f3da061f7mr1709302qkg.128.1701984160314;
        Thu, 07 Dec 2023 13:22:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984160; cv=none;
        d=google.com; s=arc-20160816;
        b=VbUDGkRWlytMR7YIzuJsxom5xDZerHfAjiie4/k7We207d5SKns59dKWm23IPg8y1B
         EYHqo+CLV14WhKot/WeyZA4t7rgXLO70k44m+wRYOfR8iYR6WoMs7oe7p7MJPLr1GoPk
         n8YAMostOw8LKCPDDOw/857hgJHSxiqgx/uWQ/q+XoZjJavFxzMDyxNFyXiVvbF3qWbO
         ZqE+Oxg17AUw0DQMcVbnseRuB3xmm/YnZz9NisCsdQmtpQsMHHEmr0EI4d9F6ngvj0g3
         080IWmGafWYzKkzdYHAsuBwgjZZ7MlR/MOX+ZAAH9IBJTpxLN2FDdgew+uzycb0AeK4l
         fP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=shWxGi+94hUVdbxc3FCgiKxDR0g1X33mrWTu84CcD7w=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=KWClXrRtakwdke4/hoD0AVPJf4Mr/I9RsKatAgBGYx3c8Ikv3OMAFLNIiSSF2OpyCj
         Jjg73C7g8a2ov5fq67/c+sn5M2ohVb2AzCawJpMXWqFvAY14AtEG5AUgjmlSha7N7rku
         Ff173G5ed4OqmTkzhkI4Ub1y3eq2T0TRUD+04xfQWNYIyxXhtHhc4csT6t5sNEu55TV6
         W09ICJKVR10Bz6VuKEpPn1pNO56gTZ2IZefhhDzIoxqMx2Zkh7H/RrnoUZLXFuvRXuzg
         Pymxgetv5ECnzy/7JDnDG0Z82Bd9jWoR7E6OmnWdMN1hdyIsuJGiA8J7NRn2nHVVi3Ra
         LOfA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id c6-20020a05620a200600b0077da5e176f4si502816qka.693.2023.12.07.13.22.40
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:22:40 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-0Ry1MbpfOFi9XvZRWdcR6A-1; Thu,
 07 Dec 2023 16:22:38 -0500
X-MC-Unique: 0Ry1MbpfOFi9XvZRWdcR6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 849E71C05B09
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:22:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 813041C0652C; Thu,  7 Dec 2023 21:22:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E42301C060AF;
	Thu,  7 Dec 2023 21:22:35 +0000 (UTC)
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
Subject: [PATCH v3 08/59] netfs: Add a ->free_subrequest() op
Date: Thu,  7 Dec 2023 21:21:15 +0000
Message-ID: <20231207212206.1379128-9-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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

Add a ->free_subrequest() op so that the netfs can clean up data attached
to a subrequest.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/objects.c    | 2 ++
 include/linux/netfs.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index c4229c5f3f54..1bd20bdad983 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -145,6 +145,8 @@ static void netfs_free_subrequest(struct netfs_io_subrequest *subreq,
 	struct netfs_io_request *rreq = subreq->rreq;
 
 	trace_netfs_sreq(subreq, netfs_sreq_trace_free);
+	if (rreq->netfs_ops->free_subrequest)
+		rreq->netfs_ops->free_subrequest(subreq);
 	kfree(subreq);
 	netfs_stat_d(&netfs_n_rh_sreq);
 	netfs_put_request(rreq, was_async, netfs_rreq_trace_put_subreq);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index d6f27000eeb0..06f57d9d09f6 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -214,6 +214,7 @@ struct netfs_request_ops {
 	unsigned int	io_subrequest_size;	/* Alloc size for netfs_io_subrequest struct */
 	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
 	void (*free_request)(struct netfs_io_request *rreq);
+	void (*free_subrequest)(struct netfs_io_subrequest *rreq);
 
 	void (*expand_readahead)(struct netfs_io_request *rreq);
 	bool (*clamp_length)(struct netfs_io_subrequest *subreq);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


Return-Path: <linux-cachefs+bncBDLIXLMFVAERBH5R36VAMGQEVNZ2CYI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 383DB7EF9CD
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:18:24 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-67049a2c8b3sf28104866d6.0
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:18:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255903; cv=pass;
        d=google.com; s=arc-20160816;
        b=RtSoSSlGGDyiwdyD3sDEhivQVRtDtChJlEiHHMePlpVlMImybjr3KPzt32ZYauwc6F
         uG9nlTMc1rfNRWmiY1Ecb4VzJvxHkaTBNOQfLH3CprJyqhLalMoUBsrkV1xT2qaqdTRN
         twK5DNNy7cXth+fIO89CEw2TnR33dxxu93E22QlZpj5bZVJ8CSrv+nlYOTXBdcxMfeCW
         n6gaVqYPlYbP1wJgLpV3cvlikmHvVaHQmyRuMzClH6CHubo5x6AmTSSnRU+7YkyahHXz
         3K+mmhsWgrh+mHeLDRkKqpdrAlYOaNPKf9x05RQlBroIM6MP/Ozg4dxrvvt2OXhqjs0o
         lOYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=IUeO/M7Pr183PLjtuCBJupHA5UCqPrQWcv5O320Bq28=;
        fh=AI41B/YzCSs7tBbUxY970+MFg5Gw1IjT3WzpBEwdswQ=;
        b=mqoLODa9W6q9ZZmOZGeXKUZXOuIk/+Y01WYeJEItCYsLPrgfBb3TpVyyJyB6o8aV3h
         IkhSzXatQq4fwTMj2YTRBkuaQc8dDJcFD9CDlBADYicuam5c03c7J6KznugG6w/beAIm
         Tckl/vnJWdTOd4R+lhXVypa5zcQLEfbOTypUStVwuZedRw5U9YuXUOt+P5F/5/jUmXpW
         vABw4YQyC1nUs7Q0azHnzZjhIainpKG0wrPvmCrQMZcQKalGJ0u5zHdEfWjEji+bhaOb
         SU+7XSSkK/I1voeV2gR/TTIrtk83bzVGuO7CWkZPPLPVKnHtvLTdy4Q3lhgFPeC7wj3p
         CMvQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255903; x=1700860703;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUeO/M7Pr183PLjtuCBJupHA5UCqPrQWcv5O320Bq28=;
        b=c5v06AWYI6TscmA7xFpIQ63ii9PBVlES0Zs9n4fASfS3fFXEHUi0TP2YK+7ircBYPd
         UhSARlcXsYntB747NpKrItoiwSh5WNfrPqh1ap5wlDqhbyTpbIWLTIwYqKcwubN8m0vO
         AMdXt9CDaBfwCDgh35gamnxvWQZlq71CL6gur5J7oHggWW9ck4OAkdAQDbNwYqyvv6yU
         h/iEh4ptBT44A0IK6hIHQZ8bmae3lZc04G6oEGSopNQSYM0EQMDaBzVjtmYZ/OV26jxH
         GctUboQ73JdRJQpPDkowAYpRf5W78TsRbASPmSNsOCM249TQgGPjQhBWcrQTx/cU3mF7
         Ukjw==
X-Gm-Message-State: AOJu0YxkErh6ccW/3Qzw+gsRZVTK/+TspPRYYzx8dheAHMP936Onl7lx
	iz+ZuKQ/s7fS9u1Hw/Bpe1YAUQ==
X-Google-Smtp-Source: AGHT+IGB1l2/YGGe4FP0ZZROq2YWbl3qgOusRm/2pNSQJX1G0iEjcI8qFeQUSIayHA7KJqtL+3bDNA==
X-Received: by 2002:a05:6214:d6e:b0:66d:9f3e:ad4 with SMTP id 14-20020a0562140d6e00b0066d9f3e0ad4mr380072qvs.9.1700255903303;
        Fri, 17 Nov 2023 13:18:23 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1a1b:b0:41c:c118:e752 with SMTP id
 f27-20020a05622a1a1b00b0041cc118e752ls575591qtb.2.-pod-prod-05-us; Fri, 17
 Nov 2023 13:18:22 -0800 (PST)
X-Received: by 2002:a05:620a:8f83:b0:77a:25bd:e612 with SMTP id ri3-20020a05620a8f8300b0077a25bde612mr716209qkn.70.1700255902683;
        Fri, 17 Nov 2023 13:18:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255902; cv=none;
        d=google.com; s=arc-20160816;
        b=iY7Xts5+MrTKx7LLoOoQgC1Zi1CS/S1oHLfIHZiaD/6/ngGcJNueKZm2bE/lcE7Pww
         1EaIGnoKoZgb+pZTqbblamzbAnhGEFVfwNDLjrn0artcIcEjyfDuEGXdps5AaFr3uKYE
         W4TRCkJIpr2bFba5V97+X0/aJokJUDjo/LO+BoIVkxW5k/HP3ukPzdu2wzVvpsf+IsRD
         S71iPe/JlqeQ/t3LURKbGGVRF2vlxA28I6BjRaKN5J8fccZ19U7RPuCvfvZDYHreJSzR
         neEnaZwActvV/OJuqClFhSGgV+k/OWs8shSmZ63U1kfB7i5dU5J3O3yDWQbpLdGi2nvb
         Yc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=QKXGchFVFu30VVEYlT0R28R+sLxOTLkYu3+LCMsGmr8=;
        fh=AI41B/YzCSs7tBbUxY970+MFg5Gw1IjT3WzpBEwdswQ=;
        b=S7MU4Tol/rpNihQDzJQEkVMsCT8L+UrN9TtrQ+M18vmW5qQfdLrtQ+1vrP0bvejOv0
         jft8/s/E3yGiBZ/xEKeF883KwXQ5ThYFyzBMuCgyd5y6YOSnL8t6pGvdOiO3XMgUvxcs
         iQYF/By5WApXeQvBWafBRyADQsLCGfVQcj/PJr20HGD2JbBZCyDG1slSlmniQWiR6JDH
         WNLa+H3r0jMoF++V0acazow9o8eL5Mj0om7plyyzKEAm5gV18X7010ttbwcrBtfSvoF8
         /sChuHYrVr9r/LBFIw5O/wEN8UzP/FLjQAJ/IaQJoOB8AvRXhOCqyBl1GXnTi033xx6b
         ozvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id k22-20020a05620a415600b0076db1b23b27si2426615qko.715.2023.11.17.13.18.22
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:18:22 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-547-V-9dpyeoNOKRDnEmwHemHA-1; Fri,
 17 Nov 2023 16:18:21 -0500
X-MC-Unique: V-9dpyeoNOKRDnEmwHemHA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE8BC2803029
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:18:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id B90752026D68; Fri, 17 Nov 2023 21:18:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AFB782026D4C;
	Fri, 17 Nov 2023 21:18:17 +0000 (UTC)
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
	linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>
Subject: [PATCH v2 39/51] netfs: Rearrange netfs_io_subrequest to put request pointer first
Date: Fri, 17 Nov 2023 21:15:31 +0000
Message-ID: <20231117211544.1740466-40-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Rearrange the netfs_io_subrequest struct to put the netfs_io_request
pointer (rreq) first.  This then allows netfs_io_subrequest to be put in a
union with a pointer to a wrapper around netfs_io_request for cifs.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cifs@vger.kernel.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 include/linux/netfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 39f885fea383..7d9b61d21a70 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -209,8 +209,8 @@ struct netfs_cache_resources {
  * the pages it points to can be relied on to exist for the duration.
  */
 struct netfs_io_subrequest {
-	struct work_struct	work;
 	struct netfs_io_request *rreq;		/* Supervising I/O request */
+	struct work_struct	work;
 	struct list_head	rreq_link;	/* Link in rreq->subrequests */
 	struct iov_iter		io_iter;	/* Iterator for this subrequest */
 	loff_t			start;		/* Where to start the I/O */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


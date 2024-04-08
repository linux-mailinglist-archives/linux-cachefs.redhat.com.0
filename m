Return-Path: <linux-cachefs+bncBDLIXLMFVAERB6FF2CYAMGQE3YV7Y4I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B489C8DD
	for <lists+linux-cachefs@lfdr.de>; Mon,  8 Apr 2024 17:53:31 +0200 (CEST)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-479eca66497sf137484137.3
        for <lists+linux-cachefs@lfdr.de>; Mon, 08 Apr 2024 08:53:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712591610; cv=pass;
        d=google.com; s=arc-20160816;
        b=GCxX77rPFjF40xFgQJGeDaNl9G/52DDJO3XaJq6wT/eq8R34oaC0neOe4tn09NxdQe
         AE1qNTJ5j77InoACHUy+HqfJ7n1fzW5E4Xb7qqXq7yIjDNV8w6Wk3S8pfVsuMhtiwt4f
         zsOBUXtQ8CZWjcjAVER+ANLkewDKun5uoDEYQeN1sSnvQfoebzX1oaMjSzjjzOcBQNVc
         lmShkgue0YkDtaMJWxDrS7JoRgryqj1oqnRJ6EohPlJvElZTlR5D486jdGEfJKs/5n4i
         x8P+FLomU7Ckml99+O1OJZILRCllmp0QsdSfZEHC2t9vIHqzrhNmADjxrU4WqpuPjzSH
         a9pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=opHNtJgsF9HkzfXyi15BHkk71DgTZSn4phRLjURTkcg=;
        fh=HRaW0gUn+i8TVkToVKwy+8+Zk/TywD4S7WrMRTcg/Hg=;
        b=dcK/bBpNwbOqALZT4rWFKLFzXOJqafdGo9b/9Tx0Sco7kHmGFVIDbogci5zgAMQVFO
         Wi6IMFhvoux6y8vzzcMmkkJmj4vOt3hTByJO3SODJI1cCttQr4zP6CzR+1X43tzT5Mp1
         iss1Fmf99BRxtpBwNjyMVeLT2xXQTcaTjLKoFp9sQfx4xzKbGygun6GscRP5f/znvuBr
         k6JfhL1VwPsMYfbwuL5KajFkY2BhKH1UCJ0QP3pqC9ZjDiBPPPzWs+mO294wtuUKXtlJ
         gimssmWaAmEft18NLIMix2y9Ny9/0knwGLEtxAx5P9MNUl74PS/aOHIFNCeAAKcZ7GnK
         lBSw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712591610; x=1713196410;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opHNtJgsF9HkzfXyi15BHkk71DgTZSn4phRLjURTkcg=;
        b=J3WxzBRf9AzGC2CMyX3rI6jT8znehHRWjlpFVYurUCCloQhwMGDDEDOmaH8qc1uKLn
         nFjSxyhfm7Yhz7FiHixwrytSa2PzyI/i8rjkvODG/+6G0m54GQHBo01FcKdk6uWmFxlG
         31x9LQ0qyA79MILfihEQmgho4PR03xpId50mghMNR+bZuC0QNeUI5klIl6RKp/40Mpdl
         AJLW4QYahfm0zTlf1ODRudfrFymJWn8LjgujACUuYHlYWrftaFwip7WVZi1A4docfqu2
         r+tPbwvQ0bL+AoBSrRg8ktreT+UtnZxZOT38yQl6Rxjp0xWtPtH6DOIHOZmdOSTvBzNJ
         UmKw==
X-Forwarded-Encrypted: i=2; AJvYcCXT5rOW8Ccv0bSsNWTGzndcyIS//QmHIrLkZvX6KqgTFH0bGNbrSHrbuoGHeD/3KPkAU2dx6lDZe8BiCL8n4OijMJVji65xmpTwu3E=
X-Gm-Message-State: AOJu0YxUdpcI0NjX00qOb0jJ6KfHq6Va5OMZOSzv8UdeGxNDLgS0h2oV
	TDSYW8nMz0Ajetres+5i71WNAcbP23lYpbEZaJiJMdLCcf44/nSnJNiKT9OB018=
X-Google-Smtp-Source: AGHT+IEgNoohNRlTq9VByoj+DCQiSYX7YPZaUMpPXHgDdUmkjJDUofppN0QD0x0D7v2ItrQ3sKtlpg==
X-Received: by 2002:a05:6102:a4c:b0:47a:e2e:40d9 with SMTP id i12-20020a0561020a4c00b0047a0e2e40d9mr1333154vss.4.1712591608794;
        Mon, 08 Apr 2024 08:53:28 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:c2e:b0:698:f37f:7964 with SMTP id
 a14-20020a0562140c2e00b00698f37f7964ls847008qvd.0.-pod-prod-04-us; Mon, 08
 Apr 2024 08:53:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvrSOFBIn2CFE91L2c1uqbSTViuH7Mh9yA+3ZFsZP/MTlXUESJizXPIDFyuS28jRjEgEUedYhZ/GXfwPLmUTcCDbzW1munDmgU/v/f4xk=
X-Received: by 2002:a05:6102:10:b0:479:d521:65cf with SMTP id j16-20020a056102001000b00479d52165cfmr7316436vsp.21.1712591608066;
        Mon, 08 Apr 2024 08:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712591608; cv=none;
        d=google.com; s=arc-20160816;
        b=E/65Z4WcJYklffx5t9SAs7bNSVUAhdBLrZZllygP5CR8OHhv8tf5+whQkNQBfG66QO
         RB+pxeaUhFfCMU6tqoS3DpNMndd/6LqOG7OZDEiLQcpVToKQ7BtS34ER0taLUPT1BWRT
         z965Uf+D5xBp0zxb0WGgbMDrNj/AsZ1tks1XC8iALiIUk1S2kvuAwZqcSsdT9O8xCopD
         aNNK5Jm6nV8Na1Q1hJwDiAOWLMBxjgIh2xUrZxo1BFBUXlE3LC9HLRGIaibIuOzRjgdz
         y3s2yDyznuQLglJfyRuSshb930/xxQBMK1Ql+oIceLRuD3sTEvfr+1R3NBRhjtA01AMN
         lfug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=f+bcJfgFYEtTu8QANHfUpgbAjKrY7REQA/S3m75PnAQ=;
        fh=HxuIBn4wGaz7X+1wW1RTc7kXUXNobpWqZwDeaFIEZuk=;
        b=nQJG9Y1OZ6INQ69OL7YALdJtqKjQbB1vCh7S8Ay6JWS/qMc1Beh4Hq6htzOE+qX3aO
         Bt+YqkDkorWTJJlwsvie7baHOJtniyG/zjycPONWjOXByPyniiR/sC0lJp1ZV/5PZX+q
         TzCKu3NTcurMuI1Vxw1K4q6XB8rL2vmbbMCZQKVBUzx9KUpndpcSht/pvg57+JyUuR4V
         5kPrRHJVtn4IM+8cz3M6GoxTP/o27woRXfvwHshQ9K4tW70tbY0uAuXN2lRW/eARPMi/
         /J9ue2S1W4+H0/LQBo8rTLuIgwzCFgtaPOsZfETnYawczCRty9cNz7YOAd9hzB6G4rEH
         B6sA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id dl16-20020ad44e10000000b0069941ae4560si7590044qvb.114.2024.04.08.08.53.27
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 08:53:28 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-138-hQY3WmZqMw-kd2AaQaBOHg-1; Mon,
 08 Apr 2024 11:53:26 -0400
X-MC-Unique: hQY3WmZqMw-kd2AaQaBOHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 313372824776
	for <linux-cachefs@gapps.redhat.com>; Mon,  8 Apr 2024 15:53:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 2D6F72033AC4; Mon,  8 Apr 2024 15:53:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 084C62033AC1;
	Mon,  8 Apr 2024 15:53:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-24-dhowells@redhat.com>
References: <20240328163424.2781320-24-dhowells@redhat.com> <20240328163424.2781320-1-dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
    Matthew Wilcox <willy@infradead.org>
Cc: dhowells@redhat.com, Jeff Layton <jlayton@kernel.org>,
    Gao Xiang <hsiangkao@linux.alibaba.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Steve French <smfrench@gmail.com>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>, netfs@lists.linux.dev,
    linux-cachefs@redhat.com, linux-afs@lists.infradead.org,
    linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
    ceph-devel@vger.kernel.org, v9fs@lists.linux.dev,
    linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org, Latchesar Ionkov <lucho@ionkov.net>,
    Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: Re: [PATCH 23/26] netfs: Cut over to using new writeback code
MIME-Version: 1.0
Date: Mon, 08 Apr 2024 16:53:17 +0100
Message-ID: <877902.1712591597@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <877901.1712591597.1@warthog.procyon.org.uk>
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

David Howells <dhowells@redhat.com> wrote:

> +		/* Wait for writeback to complete.  The writeback engine owns
> +		 * the info in folio->private and may change it until it
> +		 * removes the WB mark.
> +		 */
> +		if (folio_wait_writeback_killable(folio)) {
> +			ret = written ? -EINTR : -ERESTARTSYS;
> +			goto error_folio_unlock;
> +		}
> +

It turns out that this really kills performance with fio with as many jobs as
cpus.  It's taking up to around 8x longer to complete a pwrite() on average
and perf shows a 30% of the CPU cycles are being spent in contention on the
i_rwsem.

The reason this was added here is that writeback cannot take the folio lock in
order to clean up folio->private without risking deadlock vs the truncation
routines (IIRC).

I can mitigate this by skipping the wait if folio->private is not set and if
we're not going to attach anything there (see attached).  Note that if
writeout is ongoing and there is nothing attached to ->private, then we should
not be engaging write-streaming mode and attaching a new netfs_folio (and if
we did, we'd flush the page and wait for it anyway).

The other possibility is if we have a writeback group to set.  This only
applies to ceph for the moment and is something that will need dealing with
if/when ceph is made to use this code.

David
---

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 1eff9413eb1b..279b296f8014 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -255,7 +255,8 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 		 * the info in folio->private and may change it until it
 		 * removes the WB mark.
 		 */
-		if (folio_wait_writeback_killable(folio)) {
+		if (folio_get_private(folio) &&
+		    folio_wait_writeback_killable(folio)) {
 			ret = written ? -EINTR : -ERESTARTSYS;
 			goto error_folio_unlock;
 		}

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 67B9D2B96EC
	for <lists+linux-cachefs@lfdr.de>; Thu, 19 Nov 2020 16:54:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605801246;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xNe3PqZO7Hm8VqNTKbPhqzDWfqhZpmm/0WvCPT7oSUw=;
	b=WjB9V9C5wubQ14ZoM3lc7P4W36h0zSvE8M43zS3NjFmEwL3HUFuBiSxuZSB4BDZUjYb/oq
	QlklELGygzbGaaRoSnC7+AvJxIH7+K9a87Lt/srRroCT41XXNQZq2XQc2k1D3I/DWPBgW+
	dbv3zU2T51o5dgMB0rMOaJkLpNyaoQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-7YVzQZyjNret-sQNaHGuCw-1; Thu, 19 Nov 2020 10:54:04 -0500
X-MC-Unique: 7YVzQZyjNret-sQNaHGuCw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66677107ACE6;
	Thu, 19 Nov 2020 15:54:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6484B60CE8;
	Thu, 19 Nov 2020 15:53:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1D9918095C9;
	Thu, 19 Nov 2020 15:53:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AJFrrsp024977 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 19 Nov 2020 10:53:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 586CC5D960; Thu, 19 Nov 2020 15:53:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-246.rdu2.redhat.com
	[10.10.112.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 784DF5D9D0;
	Thu, 19 Nov 2020 15:53:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>, paulmck@kernel.org
MIME-Version: 1.0
Date: Thu, 19 Nov 2020 15:53:42 +0000
Message-ID: <2220347.1605801222@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AJFrrsp024977
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com, willy@infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-cachefs] Can you help diagnose a weird failed wake?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2220346.1605801222.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Peter, Paul,

Jeff Layton is seeing a weird failed wake in the fscache rewrite.  Can you
have a look see if I've mucked up somewhere?  For reference, Jeff's branch is
here:

	https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
	ceph-fscache-iter-experimental

The situation is that the fscache_cookie struct has a member called 'stage'
that indicates the state of a cookie representing a data file.  As a cache
object is set up, it goes through the LOOKING_UP stage (3) whilst the disk is
being queried to the ACTIVE stage (5) when the backing file has been opened -
at which point we can do I/O on it.  Each time the stage is changed, we call
wake_up_var() to ping any waiters on the variable.  Waiters use
wait_var_event() and co. to wait on it.

We've added some tracepoints.  There's a function which begins an operation on
the cache.  It waits for the cache to get into the appropriate stage as part
of that.  Around the bit doing the wait in we have:

	int __fscache_begin_operation(...)
	{
	...
	wait_and_validate:
		spin_unlock(&cookie->lock);
		cookie->trace = true;
		trace_fscache_stage_wait(cookie, stage, fscache_cookie_stage_wait_begin_op);
		timeo = wait_var_event_timeout(&cookie->stage, cookie_stage_changed(cookie, stage), 10*HZ);
		if (timeo <= 1) {
			pr_warn("%s: cookie stage change wait timed out: cookie->stage=%u stage=%u",
				__func__, READ_ONCE(cookie->stage), stage);
			fscache_print_cookie(cookie, 'O');
			trace_fscache_stage_wait(cookie, stage, fscache_cookie_stage_wait_fail);
		} else {
			trace_fscache_stage_wait(cookie, stage, fscache_cookie_stage_waited);
		}
		cookie->trace = false;
		goto again;
	...
	}

and cookie_stage_changed() looks like:

	static bool cookie_stage_changed(struct fscache_cookie *cookie, enum fscache_cookie_stage stage)
	{
		bool changed = (READ_ONCE(cookie->stage) != stage);

		if (!changed)
			trace_fscache_stage_wait(cookie, stage, fscache_cookie_stage_waiting);

		return changed;
	}

At the point the wakeup happens, we have:

	void fscache_set_cookie_stage(struct fscache_cookie *cookie,                                        
				      enum fscache_cookie_stage stage)                                      
	{                                                                                                  
		bool changed = false, trace;                                                                

		spin_lock(&cookie->lock);                                                                  
		switch (cookie->stage) {                                                                    
		case FSCACHE_COOKIE_STAGE_INDEX:                                                            
		case FSCACHE_COOKIE_STAGE_WITHDRAWING:                                                      
		case FSCACHE_COOKIE_STAGE_RELINQUISHING:                                                    
			break;                                                                              
		default:                                                                                    
			trace = cookie->trace;                                                              
			if (trace)                                                                          
				trace_fscache_stage_set(cookie, stage, fscache_cookie_stage_set_general);  
			cookie->stage = stage;                                                              
			changed = true;                                                                    
			break;                                                                              
		}                                                                                          
		spin_unlock(&cookie->lock);                                                                
		if (changed) {                                                                              
			wake_up_var(&cookie->stage);                                                        
			if (trace)                                                                          
				trace_fscache_stage_set(cookie, stage, fscache_cookie_stage_woken);        
		}                                                                                          
	}                                                                                                  

In dmesg, we see:

	[ 2977.269392] FS-Cache: __fscache_begin_operation: cookie stage change wait timed out: cookie->stage=5 stage=3
	[ 2977.269398] FS-Cache: O-cookie c=000dd7d9 [p=000dce05 fl=0 nc=0 na=2]
	[ 2977.276673] FS-Cache: O-cookie d=CEPH.in
	[ 2977.277796] FS-Cache: O-cookie o=201635
	[ 2977.278552] FS-Cache: O-key=[16] '352b930000010000feffffffffffffff'

In the trace log, we see:

	 <...>-425461  [015] ....  2967.107716: fscache_stage_wait: c=000dd7d9 WAIT beginop now=3 arg=3
	kfsc/7-896     [005] ....  2967.107717: fscache_stage_set:  c=000dd7d9 SET general  now=3 arg=5
	 <...>-425461  [015] ....  2967.107718: fscache_stage_wait: c=000dd7d9 WAITING      now=3 arg=3
	 <...>-425461  [015] ....  2967.107718: fscache_stage_wait: c=000dd7d9 WAITING      now=5 arg=3
	kfsc/7-896     [005] ....  2967.107719: fscache_stage_set:  c=000dd7d9 WOKEN        now=5 arg=5
	 <...>-425461  [015] .N..  2977.452925: fscache_stage_wait: c=000dd7d9 WAIT failed  now=5 arg=3

So we can see the wait beginning, with the stage at LOOKING_UP (3).  Note that
we're actually waiting for stage!=3.

Next, on cpu 5, we're about to set the stage ("SET" line), and then we've
completed the wakeup 2uS later ("WOKEN" line).

Whilst the stage-change is happening, the wait condition check happens twice
in quick succession (two "WAITING" lines).  The first is presumably right at
the beginning of wait_var_event() and the second is inside the wait loop.  In
the first check, the stage is still 3, but in the second call of the condition
function, it reads it as 3 (still LOOKING_UP), and so meets the condition to
do the tracepoint - which then sees it as 5 (ACTIVE), but this doesn't affect
the result of the condition function.

[*] Note that in the traceline, cookie->stage as read inside the tracepoint is
    the "now" number and the second is fed in by the caller.

wait_var_event()/wait_var_event_timeout() then goes to sleep - which it
shouldn't, because either the task state should've been cleared, or the
condition function should prevent it.

Any thoughts on how to debug this further?  Or if I've just done something
silly?

Also, do I need to use WRITE_ONCE() or smp_store_release() when setting
cookie->store, since I'm reading it outside of the spinlock, albeit through
READ_ONCE().

Thanks,
David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

